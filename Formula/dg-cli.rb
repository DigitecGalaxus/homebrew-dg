class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.2.3"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.3.tar.gz", :using => :curl
  sha256 "7a32e1b3e0e9a3bab49498d3d61c297e11d7a469e5175862f24ab9ff8cf68a72"

  # other versions
  version "2.2.3" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.3.tar.gz", :using => :curl
    sha256 "7a32e1b3e0e9a3bab49498d3d61c297e11d7a469e5175862f24ab9ff8cf68a72"
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
