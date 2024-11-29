class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.2.0"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.0.tar.gz", :using => :curl
  sha256 "5005ea322c2358af6d10f9c0f194b6e0ee57a762d350758b921044520f704090"

  # other versions
  version "2.2.0" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.0.tar.gz", :using => :curl
    sha256 "5005ea322c2358af6d10f9c0f194b6e0ee57a762d350758b921044520f704090"
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
