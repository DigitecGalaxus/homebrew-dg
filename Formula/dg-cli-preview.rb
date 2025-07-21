class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.6.16-b.1"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.6.16-b.1.tar.gz", :using => :curl
  sha256 "11eaadc29e9b5c4cf8981ff08a14d84c67169f7b35c5be47169d3d0af7a4e257"

  depends_on "openssl@3"

  conflicts_with "dg-cli", because: "cannot be installed at the same time as `dg-cli`"
  
  def install
    libexec.install Dir["*"]

    shebang_path = "#!/usr/bin/env"
    shell_path = `echo $SHELL`
    shell_name = shell_path.strip().split("/").last()
    shebang = "#{shebang_path} #{!shell_name.empty? ? shell_name : "bash"}"
    sb = shebang
    sb << "\n"
    sb << "CLI_INSTALLER=HOMEBREW CLI_CHANNEL=preview #{libexec}/dg \"$@\""
    sb << "\n"

    (bin/"dg").write sb
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{libexec}"
  end

end
