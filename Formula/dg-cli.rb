class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"

  version "2.11.9"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.11.9.tar.gz", :using => :curl
  sha256 "f94e3f38811461e3fa159e1907f766a722f66a3f0758a0ac3d67bf17fd4dc020"

  depends_on "openssl@3"
  conflicts_with "dg-cli-preview", because: "cannot be installed at the same time as `dg-cli-preview`"

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
