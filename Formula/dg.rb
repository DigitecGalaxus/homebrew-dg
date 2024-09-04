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
    # Mount the disk image
    dmg = File.basename(url)
    system "hdiutil", "attach", dmg

    # Get the mounted disk image path
    mnt = Dir.glob("/Volumes/*").max_by { |d| File.mtime(d) }

    # Install the app
    prefix.install "#{mnt}/dg.app"

    # Unmount the disk image
    system "hdiutil", "detach", mnt

    # Create a symlink to the binary
    bin.mkpath
    bin.install_symlink prefix/"dg.app/Contents/MacOS/dg" => "dg"
  end

  def caveats
    <<~EOS
      The 'dg' binary has been installed. You can run it by typing 'dg' in your terminal.
    EOS
  end

  test do
    system "#{bin}/dg", "--version"
  end

end
