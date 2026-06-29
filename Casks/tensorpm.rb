cask "tensorpm" do
  version "1.13.0"
  sha256 "501057c468930ebbf09e8b8121777954c5602385fcef424cc728c1aef2df7dae"

  url "https://github.com/Neo552/TensorPM-Releases/releases/download/v#{version}/TensorPM-macOS.dmg",
      verified: "github.com/Neo552/TensorPM-Releases/"
  name "TensorPM"
  desc "AI-powered project management with local-first architecture"
  homepage "https://tensorpm.com"

  livecheck do
    url "https://github.com/Neo552/TensorPM-Releases"
    regex(/^v?(\d+(?:\.\d+)+(?:-[a-z]+\.\d+)?)$/i)
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"]

        release["tag_name"]&.[](regex, 1)
      end
    end
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
