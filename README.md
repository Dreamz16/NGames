# NGames — Modular Narrative Engine

Unity + Ink narrative game platform built for a **weekly episode release cycle**
targeting **Web (WebGL)** first with rapid rollout to **iOS and Android**.

---

## Quick Start

### 1. Prerequisites
| Tool | Version |
|------|---------|
| Unity | 2022.3 LTS or 2023.x |
| Ink | 1.x (bundled via UPM) |
| Unity Addressables | 1.21+ (bundled via UPM) |

### 2. Open the Project
1. Open **Unity Hub** → Add → select `/Users/sushil/Documents/NGames`
2. Unity will install all packages from `Packages/manifest.json` automatically
3. Wait for the Ink Unity Integration to compile (first open only)

### 3. First Run
1. Open `Assets/Scenes/Core/Bootstrap.unity`
2. Press Play — the engine boots and loads the Episode Select screen
3. Select **Episode 001 — The Signal** to begin

---

## Architecture Overview

```
NGames/
├── Assets/
│   ├── Ink/
│   │   ├── Shared/
│   │   │   ├── globals.ink        ← Cross-episode variables & flags
│   │   │   └── functions.ink      ← Reusable Ink functions
│   │   ├── Core/
│   │   │   └── main.ink           ← Architecture docs (not played directly)
│   │   └── Episodes/
│   │       ├── Episode_001/       ← One folder per episode
│   │       └── Episode_002/
│   │
│   └── Scripts/
│       ├── Core/
│       │   ├── Narrative/
│       │   │   ├── NarrativeManager.cs   ← Ink runtime, single source of truth
│       │   │   ├── EpisodeLoader.cs      ← Local + Addressable asset loading
│       │   │   ├── DialogueController.cs ← Input → NarrativeManager → UI
│       │   │   ├── ChoicePresenter.cs    ← Choice UI bridge
│       │   │   └── InkVariableBridge.cs  ← Inspector debug / override tool
│       │   ├── State/
│       │   │   ├── GameStateManager.cs   ← Save / load (Web + Mobile aware)
│       │   │   └── SaveData.cs           ← Serializable save schema
│       │   └── Events/
│       │       ├── GameEventBus.cs       ← Typed pub/sub event system
│       │       └── NarrativeEvents.cs    ← All event types
│       ├── Episodes/
│       │   ├── EpisodeManifest.cs        ← ScriptableObject per episode
│       │   └── EpisodeRegistry.cs        ← Master episode catalog
│       ├── UI/
│       │   ├── DialogueView.cs           ← Dialogue panel UI
│       │   └── ChoiceButtonView.cs       ← Per-choice button
│       ├── Platform/
│       │   └── PlatformManager.cs        ← Web / Mobile / Desktop detection
│       └── Settings/
│           └── NarrativeConfig.cs        ← Typewriter speed, save keys, etc.
│
└── Packages/
    └── manifest.json                     ← UPM dependencies (Ink, Addressables, TMP)
```

---

## Data Flow

```
[Ink .ink file]
      │  (compiled by Ink Unity Integration plugin)
      ▼
[.ink.json TextAsset]  ←──── EpisodeManifest (ScriptableObject)
      │                              │
      │                       EpisodeRegistry
      │                              │
      ▼                              ▼
EpisodeLoader ─────────────► NarrativeManager
                                     │
                              GameEventBus (pub/sub)
                             ┌───────┴────────┐
                             ▼                ▼
                     DialogueController   GameStateManager
                             │
                             ▼
                       DialogueView (UI)
```

---

## Event System (GameEventBus)

All narrative events are fired as typed structs through `GameEventBus`.
No direct references needed between systems.

| Event | Fired when |
|-------|-----------|
| `EpisodeLoadedEvent` | An episode ink asset is loaded |
| `StoryLineReadEvent` | A line of dialogue is read |
| `ChoicePresentedEvent` | The player must make a choice |
| `ChoiceMadeEvent` | A choice index is selected |
| `StoryEndedEvent` | The episode reaches `-> END` |
| `SpeakerChangedEvent` | `# speaker: Name` tag parsed |
| `AudioCueEvent` | `# audio:` or `# music:` tag parsed |
| `SceneTransitionEvent` | `# scene: Name\|transition` tag parsed |
| `AchievementUnlockedEvent` | `# achievement: id` tag parsed |
| `FlagSetEvent` | `# flag: key = value` tag parsed |

---

## Ink Tag Reference

Use tags in your `.ink` files to trigger game events without touching C#:

```ink
# speaker: Alex
# speaker_portrait: alex_worried
# audio: door_creak
# music: ep01_ambient_static
# scene: city_archive | fade
# achievement: found_first_clue
# flag: met_the_stranger = true
```

---

## Adding a New Episode (Weekly Workflow)

1. **Duplicate** `Assets/Ink/Episodes/Episode_001/` → rename to `Episode_003/`
2. **Write** your `.ink` story — include globals and functions at the top:
   ```ink
   INCLUDE ../../Shared/globals.ink
   INCLUDE ../../Shared/functions.ink
   ```
3. **Compile** — the Ink Unity Integration auto-compiles on save in the Editor
4. **Create Manifest** — Right-click in Project → Create → NGames → Episode Manifest
   - Set `EpisodeId`, `EpisodeNumber`, `EpisodeTitle`
   - Assign the `.ink.json` TextAsset to `InkAsset`
   - For remote delivery, assign an Addressable reference to `RemoteInkAsset`
5. **Register** — Open `Assets/ScriptableObjects/EpisodeRegistry` → drag manifest into `Episodes` list
6. **Build** — Web: Build → WebGL. Mobile: use Addressables to push new content remotely

---

## Platform Notes

### WebGL (Web)
- Save data stored in `PlayerPrefs` (backed by browser IndexedDB)
- Use Addressables to deliver new episodes from CDN without a redeploy
- Target frame rate: 60fps, canvas-sized resolution

### iOS / Android (Mobile)
- Save data stored in `Application.persistentDataPath` as JSON
- **No App Store update required for new episodes** when using Addressables
- Configure `NarrativeConfig.UseAddressablesForEpisodes = true`
- Upload new `.ink.json` bundles to your Addressables remote host each week

### Editor / Desktop
- Save data in `Application.persistentDataPath`
- Use `InkVariableBridge` component for debug overrides during development

---

## Save System

`GameStateManager` persists:
- Completed episode IDs
- Per-episode Ink story state (for resume)
- Cross-episode flags, counters, and strings
- Player name

Save slots (default 3) are written automatically on:
- Application pause / background (mobile)
- Application quit
- Episode completion

---

## Configuration

Edit `Assets/ScriptableObjects/Config/NarrativeConfig` in the Inspector:

| Setting | Default | Description |
|---------|---------|-------------|
| TypewriterEnabled | true | Character-by-character text reveal |
| TypewriterCharDelay | 0.03s | Speed of typewriter |
| AutoAdvanceEnabled | false | Auto-advance without tap |
| AutoAdvanceDelay | 3.0s | Seconds before auto-advance |
| UseAddressablesForEpisodes | false | Remote episode delivery |
| RemoteContentBaseUrl | "" | CDN base URL for Addressables |
| SaveKeyPrefix | ngames_save | Prefix for save file names |
| VerboseLogging | false | Detailed console output |
