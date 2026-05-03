cask "tensorpm" do
  version "1.0.1-beta.2"
  sha256 "4e80c35b4db6289d6473dd7878cd7389286aba9471f71a8a1471762bc3a7462b"

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
