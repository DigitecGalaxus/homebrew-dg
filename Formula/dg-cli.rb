class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"

  version "2.25.3"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.25.3.tar.gz", :using => :curl
  sha256 "e25c741d8836a7219fe9e3ca8cfe99944073326a40a923b41d356bdf078d590a"

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
