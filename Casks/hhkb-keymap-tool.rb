cask "hhkb-keymap-tool" do
  version "1.1.0"
  sha256 "b4544c9a0ab53f69739a056ddf6e3b7edb784889a5dcd32b42572ade985fa9db"

  url "https://origin.pfultd.com/downloads/hhkb/mac/HHKBkeymapTool_#{version.no_dots}ma.dmg",
      verified: "origin.pfultd.com"
  name "HHKB Keymap Tool"
  desc "Keymap tool for Happy Hacking Keyboard Professional (Hybrid models only)"
  homepage "https://happyhackingkb.com/download/"

  livecheck do
    url :homepage
    strategy :page_match
    regex(/macOS\s*:\s*Version\s*(\d+(?:\.\d+)+)/i)
  end

  depends_on macos: ">= :sierra"

  pkg "HHKBkeymapTool_#{version.no_dots}ma.pkg"

  uninstall pkgutil: "jp.co.pfu.hhkb-keymap-tool.pkg.V#{version}",
            delete:  [
              "/Applications/hhkb-keymap-tool.app",
              "/Applications/HHKB/",
            ]

  zap trash: [
    "~/Library/Application Support/hhkb-keymap-tool",
    "~/Library/Preferences/jp.co.pfu.hhkb-keymap-tool.plist",
  ]
end
