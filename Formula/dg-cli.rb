class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.5.3"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.5.3.tar.gz", :using => :curl
  sha256 "6bdbe2adddea7799a1a665cc2b0dd9b6af64e99cd89ac951167e22fb1641cad6"

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
