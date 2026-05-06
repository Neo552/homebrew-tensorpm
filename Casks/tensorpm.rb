cask "tensorpm" do
  version "1.2.0-beta.1"
  sha256 "b9f389d7b3b26eca209e6a9d93557cbfdf72c4e983ab60b77b1c17c67292eb26"

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
