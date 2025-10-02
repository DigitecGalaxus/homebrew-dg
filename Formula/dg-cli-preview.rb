class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.8.1-b.5"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.8.1-b.5.tar.gz", :using => :curl
  sha256 "fda214a797ea810631aae44aed1c48b11d13227520a512df2a2e2695b5cae269"

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
