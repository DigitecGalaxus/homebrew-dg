class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.16.1-b.2"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.16.1-b.2.tar.gz", :using => :curl
  sha256 "571fd4f48f4a6b08c8a76327107f976f4bacbcf9a449ed482d6e6bb1ef739d52"

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
