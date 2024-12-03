class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.2.2"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.2.tar.gz", :using => :curl
  sha256 "227349fdf528a302f90d6e1c3a9ee0361912dd9d9d4a24e4853e640a925138a4"

  # other versions
  version "2.2.2" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.2.tar.gz", :using => :curl
    sha256 "227349fdf528a302f90d6e1c3a9ee0361912dd9d9d4a24e4853e640a925138a4"
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
