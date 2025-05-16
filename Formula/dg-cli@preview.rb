class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.5.1"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.5.1.tar.gz", :using => :curl
  sha256 "335c63a2d5b1ed8d132bb9b543177e20ddfea550089823633c0fe1137f3791d8"

  depends_on "openssl@3"
  conflicts_with "dg-cli", because: "cannot be installed at the same time as the stable `dg-cli`"

  def install
    libexec.install Dir["*"]

    (bin/"dg").write <<~EOS
      #!/usr/bin/env bash
      CLI_INSTALLER=HOMEBREW #{libexec}/dg "$@"
    EOS
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{libexec}"
  end

end
