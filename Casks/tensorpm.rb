cask "tensorpm" do
  version "1.5.1-beta.1"
  sha256 "a4f662394079dc7769f3d3e33d1ef27f7107f2ecd1308e24ce6b2b3f9bf0aa3d"

  url "https://github.com/Neo552/TensorPM-Releases/releases/download/v#{version}/TensorPM-macOS.dmg"
  name "TensorPM"
  desc "AI-powered project management with local-first architecture"
  homepage "https://tensorpm.com"

  livecheck do
    url "https://github.com/Neo552/TensorPM-Releases/releases"
    strategy :github_latest
    regex(/v?(\d+(?:\.\d+)+(?:-[a-z]+\.\d+)?)/i)
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "TensorPM.app"

  zap trash: [
    "~/Library/Application Support/TensorPM",
    "~/Library/Caches/com.tensorpm.app",
    "~/Library/Preferences/com.tensorpm.app.plist",
    "~/Library/Saved Application State/com.tensorpm.app.savedState",
  ]
end
