class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.2.4"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.4.tar.gz", :using => :curl
  sha256 "805deb44e56d1fb15a1360c290c094f9ce1fb2f2fcf4036b0a89e1184ae31c80"

  # other versions
  version "2.2.4" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.4.tar.gz", :using => :curl
    sha256 "805deb44e56d1fb15a1360c290c094f9ce1fb2f2fcf4036b0a89e1184ae31c80"
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
