class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.6.15"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.6.15.tar.gz", :using => :curl
  sha256 "c09d2ed71299a89e70df13ca3d5ceba1ec4ef28142937a11a2d4d3f59fda6228"

  depends_on "openssl@3"

  conflicts_with "dg-cli", because: "cannot be installed at the same time as `dg-cli`"
  
  def install
    libexec.install Dir["*"]

    shell = `dscl . -read ~/ UserShell | sed 's/UserShell: //'`
    sb = "#!"
    sb << shell.strip
    sb << "\n"
    sb << "CLI_INSTALLER=HOMEBREW CLI_CHANNEL=preview #{libexec}/dg \"$@\""
    sb << "\n"

    (bin/"dg").write sb
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{libexec}"
  end

end
