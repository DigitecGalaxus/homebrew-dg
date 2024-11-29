class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.2.1"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.1.tar.gz", :using => :curl
  sha256 "bf24fe427124f5e80f8eb3a86ed9260ccead42f0388172433620c506c89273e4"

  # other versions
  version "2.2.1" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.1.tar.gz", :using => :curl
    sha256 "bf24fe427124f5e80f8eb3a86ed9260ccead42f0388172433620c506c89273e4"
  end

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
