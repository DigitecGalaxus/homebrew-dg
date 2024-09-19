cask 'dg-cli' do
  version '1.13.18'
  sha256 "46fe71091ba2c0dc4b37f2f123232ca48459765483a240797a1249f296b5c156"

  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-1.13.18.dmg"
  name 'Dg'
  homepage "https://backstage.devinite.com/docs/default/component/dg.cli"

  app 'dg.app'
  binary "#{appdir}/dg.app/Contents/MacOS/dg", target: 'dg'

  postflight do
    # suppress_move_to_applications
    system "sudo", "xattr", "-rd", "com.apple.quarantine", "/Applications/dg.app"
  end
end
