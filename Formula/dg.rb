class Dg < Formula
  desc "DG CLI is the command line interface for developers @digitecgalaxus"
  homepage "https://backstage.devinite.com/docs/default/component/dg.cli"

  # Your app's version
  version "2.0.0"

  # Your app's download URL
  url "https://dg-package-repositories.platform.test.int.devinite.com/macos/brew/dg-cli/dg-cli_2.0.0.dmg"

  # Your app's SHA-256 checksum
  sha256 "83745cb9613d2a856de66650cf153caf1d83d6569ac98d9242dc297dc4ebeff2"

  def install
    system "hdiutil", "attach", "-nobrowse", "-quiet", "-mountpoint", "#{prefix}/dg", "#{url}"
    system "cp", "-r", "#{prefix}/dg/dg.app", "/Applications/"
    system "hdiutil", "detach", "#{prefix}/dg"

    # Create a symlink to the binary
    bin.install_symlink "/Applications/dg.app/Contents/MacOS/dg" => "dg"
  end

  def caveats
    <<~EOS
      The 'dg' binary has been installed. You can run it by typing 'dg' in your terminal.
    EOS
  end

  test do
    system "dg", "--version"
  end

end
