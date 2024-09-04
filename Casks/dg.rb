cask 'dg' do
    version '2.0.0'
    sha256 "83745cb9613d2a856de66650cf153caf1d83d6569ac98d9242dc297dc4ebeff2"
  
    url "https://dg-package-repositories.platform.test.int.devinite.com/macos/brew/dg-cli/dg-cli_2.0.0.dmg"
    name 'Dg'
    homepage "https://backstage.devinite.com/docs/default/component/dg.cli"
  
    app 'dg.app'
    binary "#{appdir}/dg.app/Contents/MacOS/dg", target: 'dg'

    postflight do
      # suppress_move_to_applications
      system "sudo", "xattr", "-rd", "com.apple.quarantine", "/Applications/dg.app"
    end
  end
