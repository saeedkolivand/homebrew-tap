cask "claude-usage" do
  version "0.2.0"
  sha256 "85bfb27a4a309c471016e4189ed886e65942c877306db7b3a0bc6aa42ebaee12"

  url "https://github.com/saeedkolivand/claude-usage-mac/releases/download/v#{version}/ClaudeUsage-#{version}.dmg",
      verified: "github.com/saeedkolivand/claude-usage-mac/"
  name "Claude Usage"
  desc "Claude Code usage in the menu bar and as a desktop widget"
  homepage "https://github.com/saeedkolivand/claude-usage-mac"

  # A bare symbol already means "this version or newer"; `>= :sonoma` fails
  # brew style (Homebrew/OSDependsOn).
  depends_on macos: :sonoma

  app "Claude Usage.app"

  postflight do
    # This build is ad-hoc signed and not notarized, so macOS quarantines it and
    # reports it as damaged on first launch. Homebrew is removing the
    # --no-quarantine flag, and the main homebrew/cask repo drops unsigned casks
    # in September 2026 — which is why this lives in a personal tap and clears
    # the attribute itself.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Claude Usage.app"],
                   sudo: false
  end

  uninstall quit: "com.saeedkolivand.claude-usage"

  zap trash: [
    "~/Library/Application Support/ClaudeUsage",
    "~/Library/Preferences/com.saeedkolivand.claude-usage.plist",
  ]
end
