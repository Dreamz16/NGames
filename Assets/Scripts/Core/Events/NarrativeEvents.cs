namespace NGames.Core.Events
{
    // ── Episode lifecycle ──────────────────────────────────────────────────────
    public class EpisodeLoadedEvent
    {
        public string EpisodeId;
    }

    public class EpisodeCompletedEvent
    {
        public string EpisodeId;
    }

    // ── Story progression ──────────────────────────────────────────────────────
    public class StoryLineReadEvent
    {
        public string Text;
        public string EpisodeId;
    }

    public class ChoicePresentedEvent
    {
        public string EpisodeId;
        public System.Collections.Generic.List<Ink.Runtime.Choice> Choices;
    }

    public class ChoiceMadeEvent
    {
        public string EpisodeId;
        public int    ChoiceIndex;
        public string ChoiceText;
    }

    public class StoryEndedEvent
    {
        public string EpisodeId;
    }

    // ── Tag-driven game events ─────────────────────────────────────────────────
    public class SpeakerChangedEvent
    {
        public string SpeakerName;
        public string PortraitKey;
    }

    public class AudioCueEvent
    {
        public string CueName;
        public bool   IsMusic;   // true = BGM, false = SFX
    }

    public class SceneTransitionEvent
    {
        public string SceneName;
        public string TransitionStyle; // fade, cut, slide
    }

    public class AchievementUnlockedEvent
    {
        public string AchievementId;
    }

    public class FlagSetEvent
    {
        public string FlagName;
        public bool   Value;
    }

    // ── RPG progression feedback ───────────────────────────────────────────────
    /// <summary>Fired when a character bond variable changes in Ink.</summary>
    public class BondChangedEvent
    {
        public string CharacterName; // lowercase key: "fang", "marcus", etc.
        public int    Delta;         // positive = gained, negative = lost
        public int    NewValue;
    }

    /// <summary>Fired when a stat variable (xp, dex, flow, etc.) changes in Ink.</summary>
    public class StatChangedEvent
    {
        public string StatName;  // "xp", "dex", "flow", "end", "stag", "commitment"
        public int    Delta;
        public int    NewValue;
    }
}
