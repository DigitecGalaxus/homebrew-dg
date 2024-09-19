cask 'dg-cli' do
  version '1.13.18'
  sha256 "83745cb9613d2a856de66650cf153caf1d83d6569ac98d9242dc297dc4ebeff2"

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
