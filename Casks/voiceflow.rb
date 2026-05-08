cask "voiceflow" do
  version "0.4.10"
  sha256 "88f681e214701ecafee06ae63ef573cb400ed968e0fbee21c49ccb210de4d38b"

  url "https://github.com/Raunaks068619/VoiceFlow/releases/download/v#{version}/VoiceFlow-Beta.dmg",
      verified: "github.com/Raunaks068619/VoiceFlow/"
  name "VoiceFlow"
  desc "Bilingual (Hindi/English) dictation app with real-time translation"
  homepage "https://github.com/Raunaks068619/VoiceFlow"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "VoiceFlow.app"

  # Ad-hoc signed build — strip quarantine so Gatekeeper lets it launch.
  # Remove this postflight block once we move to Apple Developer ID + notarization.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/VoiceFlow.app"],
                   sudo: false
  end

  caveats <<~EOS
    VoiceFlow needs three macOS permissions on first launch:

      1. Microphone        — click Allow when prompted
      2. Accessibility     — System Settings > Privacy & Security > Accessibility > toggle VoiceFlow ON
      3. Input Monitoring  — System Settings > Privacy & Security > Input Monitoring > toggle VoiceFlow ON

    If you previously denied any of these (e.g. upgrading from an earlier version),
    reset and relaunch:
      tccutil reset All com.voiceflow.app
      open /Applications/VoiceFlow.app

    The app lives in your menu bar (top-right) once permissions are granted.
  EOS

  uninstall quit: "com.voiceflow.app"

  zap trash: [
    "~/Library/Application Support/VoiceFlow",
    "~/Library/Caches/com.voiceflow.app",
    "~/Library/Logs/VoiceFlow",
    "~/Library/Preferences/com.voiceflow.app.plist",
  ]
end
