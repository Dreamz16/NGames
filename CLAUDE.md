# NGames

Unity 6 visual novel using Ink for narrative. macOS dev, targeting Desktop + WebGL.

## Repo
- Path: `/Users/sushil/Documents/NGames`
- Remote: https://github.com/Dreamz16/NGames
- Branch: `main`

## Tech Stack
- Unity 6 / C#
- Ink (narrative scripting) via `Ink.Runtime`
- TextMeshPro for all UI text
- Unity Input System (new)
- Addressables for remote episode assets

## Architecture
- `GameEventBus` — type-safe pub/sub; all systems communicate through events, never directly
- `NarrativeManager` — Ink runtime, tag parsing, no UI dependencies
- `DialogueController` — typewriter reveal, auto-advance (words/sec), tap-to-skip
- `DialogueView` — bottom panel UI; two character portrait slots (left/right) + text area + choices
- `CharacterDisplayManager` — two-slot portrait system; slot alpha fade for active/inactive speaker; hides both slots and clears slot state on narrator lines
- `VoiceManager` — OS TTS (self-bootstraps); syncs typewriter CPS to estimated TTS duration via `SyncedCPS` static property
- `SceneBackgroundController` — gradient palette + optional sprite backgrounds
- `AmbientEffectsController` — vignette, dust motes (self-bootstraps)
- `SceneTransitionOverlay` — black fade between scenes (self-bootstraps)
- `GameVariablesPanel` — dev overlay, backtick/F2 toggle (self-bootstraps)
- `GameStateManager` — save/load, flags, counters, player name

## Namespaces
- `NGames.UI` — all UI scripts
- `NGames.Core.Narrative` — NarrativeManager, DialogueController, EpisodeLoader
- `NGames.Core.Events` — all event classes + GameEventBus
- `NGames.Core.State` — GameStateManager, SaveData, SaveSystem
- `NGames.Episodes` — EpisodeManifest, EpisodeRegistry
- `NGames.Settings` — NarrativeConfig

## Ink Tag Convention
```
# speaker: NAME          → SpeakerChangedEvent
# scene: KEY             → SceneTransitionEvent
# expression: EXPR       → ExpressionChangedEvent
# music: CUE             → AudioCueEvent (IsMusic=true)
# audio: CUE             → AudioCueEvent (IsMusic=false)
# flag: NAME=value       → FlagSetEvent + GameStateManager
# achievement: ID        → AchievementUnlockedEvent
```

Valid expressions: `neutral` `happy` `angry` `sad` `surprised` `speaking`

## Character Expression Files
`Resources/Characters/{key}_{expression}.png`
Falls back to `Resources/Characters/{key}.png`, then coloured placeholder.

## Character Accent Colours (CharacterDisplayManager)
| Key | Colour |
|-----|--------|
| ishani | orange `(0.85, 0.55, 0.20)` |
| lawrence | gold `(0.90, 0.68, 0.18)` |
| fang | teal `(0.20, 0.78, 0.62)` |
| marcus | blue `(0.45, 0.55, 0.90)` |
| tiberius | red `(0.80, 0.25, 0.25)` |
| kira | pink `(0.90, 0.40, 0.70)` |
| almas | purple `(0.65, 0.50, 0.90)` |
| batu | green `(0.55, 0.72, 0.35)` |
| jiwon | amber `(0.85, 0.55, 0.30)` |
| nadia | violet `(0.75, 0.40, 0.75)` |

## Writer Pipeline
- Source files: `Writer/*.twee` (SugarCube 2 format)
- Converter: `Tools/pipeline/twee-to-ink.js` → outputs to `Assets/Ink/Episodes/<name>/<name>.ink`
- Watcher: `cd Tools/pipeline && npm start` — watches for changes, converts, compiles, deploys
- Episode mapping: `Tools/pipeline/episodes.json` — maps twee filename → episodeId → Resources path
- Compiled JSON lands at `Assets/Resources/Ink/<episodeId>.json`

## Ink Gotchas
- **Entry divert required**: Ink executes from the top of the file. Without `-> startKnot` before the first `=== knot ===`, the story ends immediately with "- end -"
- **inklecate binary**: lives in `~/.npm/_npx/<hash>/node_modules/inklecate/bin/inklecate`; needs `chmod +x` on first use (watch.js handles this automatically)
- **inkVersion 21**: inklecate npm package produces inkVersion 21, compatible with Unity Ink runtime (inkVersionCurrent=21, inkVersionMinimumCompatible=18)

## Episode Asset Wiring
Both copies of the manifest must have `InkAsset` GUID wired — editing one without the other breaks loading:
- `Assets/ScriptableObjects/Episodes/<Name>.asset`
- `Assets/Resources/Episodes/<Name>.asset`

Format: `InkAsset: {fileID: 4900000, guid: <GUID>, type: 3}`

## VoiceManager Neural Voices
The following voices must be downloaded in **System Settings → Accessibility → Spoken Content → System Voice → Manage Voices**:
`Ava` (US female), `Evan` (US male), `Allison` (US female), `Daniel` (UK male), `Aaron` (US male), `Zoe` (US female)

## Key Unity Gotchas
- **Never** use `??` with `GetComponent` — use explicit `!= null` (Unity fake-null)
- **Never** use `?.` on Unity objects in string interpolation — throws `MissingComponentException`
- `GameEventBus.Publish` catches exceptions per-handler — a throw silently aborts that handler
- `CanvasGroup` added via `AddComponent` at runtime starts with alpha=1 ✓
- Screen Space Overlay canvas `LocalScale (0,0,0)` in scene YAML is normal

## Coding Conventions
- Subscribe to events in `OnEnable`, unsubscribe in `OnDisable`
- Self-bootstrapping singletons: `[RuntimeInitializeOnLoadMethod(AfterSceneLoad)]`
- No direct component references between systems — use `GameEventBus`
- Keep `NarrativeManager` free of UI dependencies

## Git
- Commit messages: imperative mood, describe the *why* not the *what*
- Never amend published commits — create new ones
- Always confirm before force-pushing
