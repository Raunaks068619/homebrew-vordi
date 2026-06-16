# Vordi

> Bilingual dictation for macOS. Hold `Fn`, speak Hindi or English, get clean text anywhere.

Native macOS dictation is English-only. Wispr Flow is English-only. Vordi is built for the other 600 million people who code-switch Hindi and English all day.

## Install

```bash
brew install --cask Raunaks068619/vordi/vordi
```

That's the whole install. Vordi.app lands in `/Applications`, menu-bar icon appears on first launch.

> Don't have Homebrew? Get it at [brew.sh](https://brew.sh), then run the command above.

## Requirements

- macOS 13 Ventura or newer
- Apple Silicon Mac (M1 / M2 / M3 / M4)
- OpenAI API key — get one at [platform.openai.com/api-keys](https://platform.openai.com/api-keys). Your key stays on your Mac; requests go directly to OpenAI.

## First launch

1. Click the menu-bar icon → **Open Vordi** → **Settings**
2. Paste your OpenAI API key
3. Grant **Microphone** + **Accessibility** permissions when prompted
4. Hold `Fn` anywhere on your Mac, speak, release. Your words appear at the cursor.

## Modes

**Language**
- `Auto` — detects Hindi, English, or Hinglish on the fly
- `English` — forces English output. Speak Hindi, get translated English.

**Output Style**
- `Verbatim` — raw transcript, no cleanup
- `Clean` — removes fillers, fixes punctuation
- `Clean + Hinglish` — Latin-script transliteration for mixed Hindi/English

**Processing Mode**
- `Dictation` — preserves your phrasing
- `Rewrite` — tightens grammar, collapses restarts

## Upgrade

```bash
brew upgrade --cask vordi
```

## Uninstall

```bash
brew uninstall --cask vordi
```

To also wipe preferences and logs:

```bash
brew uninstall --cask --zap vordi
```

## Troubleshooting

**App doesn't launch after install**
The cask strips Gatekeeper quarantine automatically, but if something went sideways:

```bash
xattr -cr /Applications/Vordi.app
```

**`Fn` key does nothing**
System Settings → Keyboard → "Press Fn key to" → try **Do Nothing** or **Emoji & Symbols** (avoids conflicts).

**"API Error: Incorrect API key"**
OpenAI keys start with `sk-`. Re-check the key in Settings.

**No text appears after dictation**
Open the **Run Log** tab for the exact error from the last attempt.

## About this build

This is an **ad-hoc signed beta** — no Apple Developer ID yet. The Homebrew cask handles Gatekeeper for you, so install stays one-line. A notarized build ships once we validate demand.

- Architecture: arm64 only
- Signing: ad-hoc + hardened runtime
- Entitlements: `com.apple.security.device.audio-input`
- Privacy: zero telemetry, zero analytics, no server. Your key, your audio, your machine.

## Feedback

Bugs, weird outputs, UX pain — open an issue on this repo or DM [@raunaksingh](https://twitter.com/raunaksingh). Screenshots of the Run Log help enormously; they capture transcript + timing + error in one frame.
