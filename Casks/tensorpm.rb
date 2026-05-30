cask "tensorpm" do
  version "1.8.1-beta.1"
  sha256 "3175be8aa0bfe3bda2972a1adb6f22b59be5b04e82a4cd98d8f158fa278476bf"

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
