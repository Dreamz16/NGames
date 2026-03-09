#!/usr/bin/env node
/**
 * watch.js — NGames Twine → Ink pipeline watcher
 *
 * Watches Writer/*.twee for changes.
 * On change:
 *   1. Converts .twee → .ink  (via twee-to-ink.js)
 *   2. Writes .ink to Assets/Ink/Episodes/<EpisodeName>/
 *   3. Unity's Ink Integration package auto-detects the changed .ink and
 *      recompiles it to .ink.json — no inklecate required.
 *
 * Usage:
 *   cd Tools/pipeline && npm install && node watch.js
 *   # or:  npm start
 */

'use strict';

const fs       = require('fs');
const path     = require('path');
const { execFileSync } = require('child_process');
const chokidar = require('chokidar');
const { convertTweeToInk } = require('./twee-to-ink');

// ── Paths ──────────────────────────────────────────────────────────────────
const ROOT         = path.resolve(__dirname, '../..');
const WRITER_DIR   = path.join(ROOT, 'Writer');
const EPISODES_DIR = path.join(ROOT, 'Assets', 'Ink', 'Episodes');
const EPISODES_CFG = JSON.parse(fs.readFileSync(path.join(__dirname, 'episodes.json'), 'utf8'));

// ── Find inklecate binary (npx cache or PATH) ─────────────────────────────
function findInklecate() {
    // Try npx-cached inklecate first
    const npxCache = path.join(
        process.env.HOME, '.npm', '_npx'
    );
    if (fs.existsSync(npxCache)) {
        for (const dir of fs.readdirSync(npxCache)) {
            const bin = path.join(npxCache, dir, 'node_modules', 'inklecate', 'bin', 'inklecate');
            if (fs.existsSync(bin)) { try { fs.chmodSync(bin, '755'); } catch {} return bin; }
        }
    }
    return null;  // fall back to Unity auto-compile
}
const INKLECATE = findInklecate();

// ── Compile .ink → .json and copy to Resources ────────────────────────────
function compileAndDeploy(baseName, inkPath) {
    const cfg = EPISODES_CFG.find(e => e.tweeFile === baseName);
    if (!cfg) return;   // no mapping — Unity will compile on next focus

    const outJson = inkPath.replace(/\.ink$/, '.json');

    if (INKLECATE) {
        try {
            execFileSync(INKLECATE, [inkPath], { stdio: 'pipe' });
            // inklecate outputs {name}.json in the same directory
            if (fs.existsSync(outJson)) {
                const destPath = path.join(ROOT, cfg.resourcesPath);
                fs.mkdirSync(path.dirname(destPath), { recursive: true });
                fs.copyFileSync(outJson, destPath);
                console.log(`[pipeline] Deployed → ${cfg.resourcesPath}`);
            }
        } catch (e) {
            const stderr = e.stderr?.toString() || e.message;
            console.error(`[pipeline] inklecate errors:\n${stderr}`);
        }
    } else {
        console.log(`[pipeline] No inklecate found — Unity will compile on next editor focus.`);
        console.log(`           Then manually copy the .ink.json to ${cfg.resourcesPath}`);
    }
}

// ── Convert a single .twee file ────────────────────────────────────────────
function convertFile(tweePath) {
    const baseName   = path.basename(tweePath, path.extname(tweePath));
    const episodeDir = path.join(EPISODES_DIR, baseName);
    const outInkPath = path.join(episodeDir, `${baseName}.ink`);

    try {
        const src = fs.readFileSync(tweePath, 'utf8');
        const ink = convertTweeToInk(src, baseName);

        if (!fs.existsSync(episodeDir)) {
            fs.mkdirSync(episodeDir, { recursive: true });
            console.log(`[pipeline] Created episode folder: ${path.relative(ROOT, episodeDir)}`);
        }

        fs.writeFileSync(outInkPath, ink, 'utf8');
        const ts = new Date().toLocaleTimeString();
        console.log(`[pipeline] ${ts}  ${path.relative(ROOT, tweePath)}  →  ${path.relative(ROOT, outInkPath)}`);

        compileAndDeploy(baseName, outInkPath);

    } catch (err) {
        console.error(`[pipeline] ERROR converting ${tweePath}:`, err.message);
    }
}

// ── Boot: convert any existing .twee files immediately ─────────────────────
if (!fs.existsSync(WRITER_DIR)) {
    fs.mkdirSync(WRITER_DIR, { recursive: true });
    console.log(`[pipeline] Created Writer/ directory at ${WRITER_DIR}`);
}

const existingFiles = fs.readdirSync(WRITER_DIR)
    .filter(f => f.endsWith('.twee'))
    .map(f => path.join(WRITER_DIR, f));

if (existingFiles.length > 0) {
    console.log(`[pipeline] Initial conversion of ${existingFiles.length} file(s)...`);
    existingFiles.forEach(convertFile);
}

// ── Watcher ────────────────────────────────────────────────────────────────
console.log(`\n[pipeline] Watching ${path.relative(ROOT, WRITER_DIR)}/*.twee  (Ctrl-C to stop)\n`);

const watcher = chokidar.watch(path.join(WRITER_DIR, '**/*.twee'), {
    persistent:    true,
    ignoreInitial: true,    // already did initial pass above
    awaitWriteFinish: { stabilityThreshold: 300, pollInterval: 100 },
});

watcher
    .on('add',    filePath => { console.log(`[pipeline] New file: ${path.basename(filePath)}`); convertFile(filePath); })
    .on('change', filePath => { console.log(`[pipeline] Changed: ${path.basename(filePath)}`);  convertFile(filePath); })
    .on('error',  err      => console.error('[pipeline] Watcher error:', err));

process.on('SIGINT', () => { watcher.close(); console.log('\n[pipeline] Stopped.'); process.exit(0); });
