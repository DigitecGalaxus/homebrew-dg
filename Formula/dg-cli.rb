class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.5.4"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.5.4.tar.gz", :using => :curl
  sha256 "f77a29757c72b2a2a3e812d08a787b568f7d058568ffbd9f4e3fb6f34d3458ed"

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
