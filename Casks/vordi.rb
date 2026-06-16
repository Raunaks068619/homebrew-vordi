cask "vordi" do
  version "0.6.3"
  sha256 "76c2e40bc3369f97b67c61919e36e1e36c075cf9afcb8354e83c907c8e82860d"

  url "https://github.com/Raunaks068619/Vordi/releases/download/v#{version}/Vordi-Beta.dmg",
      verified: "github.com/Raunaks068619/Vordi/"
  name "Vordi"
  desc "Bilingual (Hindi/English) dictation app with real-time translation"
  homepage "https://github.com/Raunaks068619/Vordi"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "Vordi.app"

  # Ad-hoc signed build — strip quarantine so Gatekeeper lets it launch.
  # Remove this postflight block once we move to Apple Developer ID + notarization.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Vordi.app"],
                   sudo: false
  end

  caveats <<~EOS
    Vordi needs three macOS permissions on first launch:

      1. Microphone        — click Allow when prompted
      2. Accessibility     — System Settings > Privacy & Security > Accessibility > toggle Vordi ON
      3. Input Monitoring  — System Settings > Privacy & Security > Input Monitoring > toggle Vordi ON

    If you previously denied any of these (e.g. upgrading from an earlier version),
    reset and relaunch:
      tccutil reset All com.vordi.app
      open /Applications/Vordi.app

    The app lives in your menu bar (top-right) once permissions are granted.
  EOS

  uninstall quit: "com.vordi.app"

  zap trash: [
    "~/Library/Application Support/Vordi",
    "~/Library/Caches/com.vordi.app",
    "~/Library/Logs/Vordi",
    "~/Library/Preferences/com.vordi.app.plist",
  ]
end
