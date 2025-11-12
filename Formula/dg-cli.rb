class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"

  version "2.10.0"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.10.0.tar.gz", :using => :curl
  sha256 "9d46e31380ce950cbf1d4b433daa3a7ca07241678f9dc190ce5d32d1299212d4"

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
