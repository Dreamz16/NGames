#!/usr/bin/env node
/**
 * twee-to-ink.js  —  NGames Twine/SugarCube 2 → Ink converter
 *
 * Handles the full NGames SugarCube 2 authoring format:
 *   <div class="dlg">       → # speaker: Name  +  dialogue line
 *   <div class="choice">    → + [text] -> target
 *   <div class="loc-tag">   → // 📍 Location comment
 *   <div class="sys ...">   → skipped (design notes / combat callouts)
 *   <div class="act-banner"> → // ACT: ... comment
 *   <<set $var …>>          → ~ var = value / ~ var = var + n
 *   <<if>> … <<else>> … <</if>> → { cond: … - else: … }
 *   <<print $var>>          → {var}
 *   <<journal …>>           → skipped
 *   HTML entities           → Unicode equivalents
 *   //italics//             → plain text (Ink has no inline markup)
 *   ''bold''                → plain text
 *   CSS passages (-webkit-*) → skipped
 *   JSON position tags      → stripped from passage names
 */

'use strict';

const fs   = require('fs');
const path = require('path');

// ── HTML entity table ──────────────────────────────────────────────────────
const ENTITIES = {
    '&ldquo;': '"', '&rdquo;': '"', '&lsquo;': '\u2018', '&rsquo;': '\u2019',
    '&amp;': '&', '&lt;': '<', '&gt;': '>',
    '&nbsp;': ' ', '&mdash;': '\u2014', '&ndash;': '\u2013',
    '&hellip;': '\u2026', '&apos;': "'",
    '&#10003;': '\u2713', '&#x2713;': '\u2713',
    '&#x1F3B5;': '\uD83C\uDFB5', '&times;': '\u00D7',
    '&copy;': '\u00A9', '&trade;': '\u2122',
};
function decodeEntities(s) {
    return s.replace(/&(?:#x[0-9a-fA-F]+|#\d+|[a-zA-Z]+);/g, e => ENTITIES[e] || e);
}
function stripHtml(s) { return s.replace(/<[^>]+>/g, ''); }
function scMarkup(s) {
    return s
        .replace(/\/\/([^/]+)\/\//g, '$1')   // //italics//
        .replace(/''([^']+)''/g, '$1');       // ''bold''
}

// ── Slug (passage name → knot name) ───────────────────────────────────────
function slugify(name) {
    return name
        .toLowerCase()
        .replace(/['']/g, '')
        .replace(/[^a-z0-9]+/g, '_')
        .replace(/^_+|_+$/g, '');
}

// ── SugarCube condition → Ink condition ───────────────────────────────────
function convertCondition(cond) {
    return cond
        .replace(/\$(\w+)/g, '$1')
        .replace(/\band\b/gi, '&&')
        .replace(/\bor\b/gi, '||')
        .replace(/\bnot\b/gi, '!')
        .replace(/\bgte\b/gi, '>=')
        .replace(/\blte\b/gi, '<=')
        .replace(/\bgt\b/gi, '>')
        .replace(/\blt\b/gi, '<')
        .replace(/\beq\b/gi, '==')
        .replace(/\bneq\b/gi, '!=')
        .trim();
}

// ── Single <<set>> inner → Ink assignment ─────────────────────────────────
function convertSet(inner) {
    inner = inner.trim();
    let m;
    if ((m = inner.match(/^\$(\w+)\s*\+=\s*(.+)$/)))  return `~ ${m[1]} = ${m[1]} + ${m[2].trim().replace(/\$(\w+)/g,'$1')}`;
    if ((m = inner.match(/^\$(\w+)\s*-=\s*(.+)$/)))  return `~ ${m[1]} = ${m[1]} - ${m[2].trim().replace(/\$(\w+)/g,'$1')}`;
    if ((m = inner.match(/^\$(\w+)\s*\*=\s*(.+)$/)))  return `~ ${m[1]} = ${m[1]} * ${m[2].trim().replace(/\$(\w+)/g,'$1')}`;
    if ((m = inner.match(/^\$(\w+)\s+to\s+(.+)$/)))   return `~ ${m[1]} = ${m[2].trim().replace(/\$(\w+)/g,'$1')}`;
    if ((m = inner.match(/^\$(\w+)\s*=\s*(.+)$/)))    return `~ ${m[1]} = ${m[2].trim().replace(/\$(\w+)/g,'$1')}`;
    return `/* set: ${inner} */`;
}

// ── Parse .twee source into passage objects ────────────────────────────────
// Handles both [tag] and {"position":…} metadata in headers
function parsePassages(src) {
    const passages = [];
    // Match :: Name [optional tags] or :: Name {"json"}
    const headerRe = /^::\s*(.+?)(?:\s*(?:\[[^\]]*\]|\{[^}]*\})\s*)*\s*$/;
    let current = null;

    for (const line of src.split('\n')) {
        const m = line.match(/^::\s*(.+?)(?:\s*(?:\[[^\]]*\]|\{"[^}]*\})\s*)*\s*$/);
        if (line.startsWith('::')) {
            // Robust: strip trailing JSON position tags and [tag] blocks
            let name = line.slice(2)
                .replace(/\{[^}]*\}/g, '')   // strip {"position":...}
                .replace(/\[[^\]]*\]/g, '')   // strip [tags]
                .trim();
            if (current) passages.push(current);
            current = { name, body: [] };
        } else if (current) {
            current.body.push(line);
        }
    }
    if (current) passages.push(current);
    return passages;
}

// ── Extract StoryData JSON ─────────────────────────────────────────────────
function extractStoryData(passages) {
    const sd = passages.find(p => /^StoryData$/i.test(p.name));
    if (!sd) return {};
    try { return JSON.parse(sd.body.join('\n')); } catch { return {}; }
}

// ── Extract variable declarations from all passages ────────────────────────
function extractVarDeclarations(passages) {
    const vars = new Map();  // name → default value string
    for (const p of passages) {
        for (const line of p.body) {
            // <<set $var to value>> or <<set $var = value>> (not +=/-=)
            const matches = line.matchAll(/<<set\s+\$(\w+)\s+(?:to|=)\s+([^>+\-*]+?)>>/g);
            for (const m of matches) {
                if (!vars.has(m[1])) vars.set(m[1], m[2].trim().replace(/\$(\w+)/g, '$1'));
            }
        }
    }
    return vars;
}

// ── Should this passage be skipped? ───────────────────────────────────────
const SKIP_NAMES = /^(StoryTitle|StoryData|StorySettings|StoryMenu|StoryShare|StoryAuthor|StoryBanner|StoryCaption|StoryInit|StoryVars|-webkit)/i;
function shouldSkip(name) { return SKIP_NAMES.test(name); }

// ── Convert a passage body to Ink lines ───────────────────────────────────
function processBody(bodyLines) {
    const out = [];
    let ifDepth = 0;
    const ind = () => '    '.repeat(ifDepth);

    for (const rawLine of bodyLines) {
        const line = rawLine.trimEnd();
        const t = line.trim();
        if (!t) { out.push(''); continue; }

        // ── Skip sys divs (design notes, combat callouts, music refs) ──
        if (/^<div[^>]*class="sys[^"]*"/.test(t)) continue;

        // ── Act banner → comment ──
        if (/^<div[^>]*class="act-banner"/.test(t)) {
            const text = decodeEntities(stripHtml(t)).trim();
            if (text) out.push(`${ind()}// ═══ ${text} ═══`);
            continue;
        }

        // ── Location tag → comment ──
        const locM = t.match(/^<div[^>]*class="loc-tag"[^>]*>(.*?)<\/div>/);
        if (locM) {
            out.push(`${ind()}// ${decodeEntities(stripHtml(locM[1])).trim()}`);
            continue;
        }

        // ── Dialogue div → # speaker: Name + text ──
        // <div class="dlg"><span class="who CHAR">CHAR:</span> <span class="line">text</span></div>
        const dlgM = t.match(/<div[^>]*class="dlg"[^>]*>.*?<span[^>]*class="who\s+([^"]+)"[^>]*>[^<]*<\/span>\s*<span[^>]*class="line"[^>]*>(.*?)<\/span><\/div>/);
        if (dlgM) {
            const charKey  = dlgM[1].trim().split(/\s+/).pop();
            const charName = charKey.charAt(0).toUpperCase() + charKey.slice(1);
            const text     = decodeEntities(scMarkup(stripHtml(dlgM[2]))).trim();
            out.push(`${ind()}# speaker: ${charName}`);
            out.push(`${ind()}${text}`);
            continue;
        }

        // ── Choice div → Ink choice ──
        // <div class="choice"><<link "text" "Target">><</link>>...</div>
        const choiceM = t.match(/<div[^>]*class="choice"[^>]*><<link\s+"((?:[^"\\]|\\.)*)"\s+"([^"]+)">>/);
        if (choiceM) {
            const text   = decodeEntities(scMarkup(choiceM[1])).trim();
            const target = slugify(choiceM[2]);
            out.push(`${ind()}+ [${text}] -> ${target}`);
            continue;
        }

        // ── <<if $cond>> ──
        const ifM = t.match(/^<<if\s+(.*?)>>\s*$/);
        if (ifM) {
            out.push(`${ind()}{${convertCondition(ifM[1])}:`);
            ifDepth++;
            continue;
        }

        // ── <<elseif $cond>> ──
        const elseifM = t.match(/^<<elseif\s+(.*?)>>\s*$/);
        if (elseifM) {
            ifDepth--;
            out.push(`${ind()}- ${convertCondition(elseifM[1])}:`);
            ifDepth++;
            continue;
        }

        // ── <<else>> ──
        if (/^<<else>>\s*$/.test(t)) {
            ifDepth--;
            out.push(`${ind()}- else:`);
            ifDepth++;
            continue;
        }

        // ── <<endif>> / <</if>> ──
        if (/^<<\/if>>\s*$/.test(t) || /^<<endif>>\s*$/.test(t)) {
            ifDepth = Math.max(0, ifDepth - 1);
            out.push(`${ind()}}`);
            continue;
        }

        // ── Lines with <<set>> macros ──
        if (/<<set\s/.test(t)) {
            const sets = [];
            t.replace(/<<set\s+(.*?)>>/g, (_, inner) => { sets.push(convertSet(inner)); });
            // Anything left on the line after stripping macros?
            const rest = decodeEntities(scMarkup(stripHtml(
                t.replace(/<<set\s+.*?>>/g, '').replace(/<<.*?>>/g, '')
            ))).trim();
            for (const s of sets) out.push(`${ind()}${s}`);
            if (rest) out.push(`${ind()}${rest}`);
            continue;
        }

        // ── <<print $var>> ──
        if (/<<print\s/.test(t)) {
            const converted = decodeEntities(scMarkup(stripHtml(
                t.replace(/<<print\s+\$(\w+)>>/g, (_, v) => `{${v}}`)
                 .replace(/<<.*?>>/g, '')
            ))).trim();
            if (converted) out.push(`${ind()}${converted}`);
            continue;
        }

        // ── <<journal …>> → skip ──
        if (/^<<journal\b/.test(t)) continue;

        // ── Other unknown macros → comment ──
        if (/^<<[a-z]/.test(t)) {
            out.push(`${ind()}/* TODO: ${t} */`);
            continue;
        }

        // ── Lines that are pure HTML with no text (e.g. layout divs) ──
        const stripped = decodeEntities(scMarkup(stripHtml(t))).trim();
        if (!stripped) continue;

        // ── Ordinary narrative text ──
        out.push(`${ind()}${stripped}`);
    }

    return out;
}

// ── Main convert function ──────────────────────────────────────────────────
function convertTweeToInk(src, episodeId) {
    const passages  = parsePassages(src);
    const storyData = extractStoryData(passages);
    const startName = storyData.start || 'Start';
    const allVars   = extractVarDeclarations(passages);

    const inkParts = [];

    inkParts.push(
        `// ─────────────────────────────────────────────────────────────────────────`,
        `// ${episodeId} — Auto-generated from ${episodeId}.twee by NGames pipeline`,
        `// DO NOT EDIT DIRECTLY — edit the .twee source in Writer/ instead`,
        `// ─────────────────────────────────────────────────────────────────────────`,
        ``,
        `INCLUDE ../../Shared/globals.ink`,
        `INCLUDE ../../Shared/functions.ink`,
        ``,
        `EXTERNAL get_player_name()`,
        `EXTERNAL has_completed_episode(episode_id)`,
        ``
    );

    // Variable declarations
    for (const [varName, defaultVal] of allVars) {
        inkParts.push(`VAR ${varName} = ${defaultVal}`);
    }
    if (allVars.size > 0) inkParts.push('');

    // Find the start passage and put it first
    const startPassage = passages.find(p => p.name === startName);
    const otherPassages = passages.filter(
        p => !shouldSkip(p.name) && p.name !== startName
    );
    const ordered = startPassage
        ? [startPassage, ...otherPassages]
        : otherPassages;

    for (const p of ordered) {
        if (shouldSkip(p.name)) continue;

        const knotName = slugify(p.name);
        const bodyLines = processBody(p.body);

        inkParts.push(`=== ${knotName} ===`);
        inkParts.push(...bodyLines);

        // Ensure every knot ends with a divert or choice
        const lastMeaningful = [...bodyLines].reverse().find(l => l.trim() !== '');
        if (!lastMeaningful ||
            (!lastMeaningful.trim().startsWith('->') &&
             !lastMeaningful.trim().startsWith('+') &&
             !lastMeaningful.trim().startsWith('*') &&
             !lastMeaningful.trim().endsWith('}'))) {
            inkParts.push('-> END');
        }
        inkParts.push('');
    }

    return removeEmptyConditionals(inkParts.join('\n'));
}

// ── Post-process: remove empty conditional blocks ─────────────────────────
// Handles cases where both branches contained only skipped content (sys divs)
function removeEmptyConditionals(ink) {
    let prev;
    do {
        prev = ink;
        // { cond: (optional whitespace/empty lines) } with nothing between
        ink = ink.replace(/\{[^{}]+:\s*\n(\s*\n)*\s*\}/g, '');
        // { cond: (empty) - else: (empty) }
        ink = ink.replace(/\{[^{}]+:\s*\n(\s*\n)*\s*-[^\n]+:\s*\n(\s*\n)*\s*\}/g, '');
        // collapse 3+ consecutive blank lines to 2
        ink = ink.replace(/\n{3,}/g, '\n\n');
    } while (ink !== prev);
    return ink;
}

// ── CLI ────────────────────────────────────────────────────────────────────
if (require.main === module) {
    const [,, inputPath, outputPath] = process.argv;
    if (!inputPath) {
        console.error('Usage: node twee-to-ink.js <input.twee> [output.ink]');
        process.exit(1);
    }
    const src = fs.readFileSync(inputPath, 'utf8');
    const base = path.basename(inputPath, path.extname(inputPath));
    const ink  = convertTweeToInk(src, base);
    const out  = outputPath || inputPath.replace(/\.twee$/, '.ink');
    fs.writeFileSync(out, ink, 'utf8');
    console.log(`Converted: ${inputPath} → ${out}  (${ink.split('\n').length} lines)`);
}

module.exports = { convertTweeToInk, slugify };
