class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.7.1"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.7.1.tar.gz", :using => :curl
  sha256 "e8ff09217c60267eab0e3acb609cfbd5355ad32e4e5fc4f7a0da6cfb9275499f"

  depends_on "openssl@3"

  conflicts_with "dg-cli", because: "cannot be installed at the same time as `dg-cli`"
  
  def install
    libexec.install Dir["*"]

    (bin/"dg").write <<~EOS
      #!/usr/bin/env bash
      CLI_INSTALLER=HOMEBREW CLI_CHANNEL=preview #{libexec}/dg "$@"
    EOS
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{libexec}"
  end

end
