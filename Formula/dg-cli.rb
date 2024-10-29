class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.1.1"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.1.1.tar.gz", :using => :curl
  sha256 "10d4748dfbe04b6814ae364d98fa173a13b7db05c25bd0ab1de48ffb012a0f2a"

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

  test do
    version_text = shell_output("#{bin}/dg --version")
    assert_equal version_text, "dg 2.1.1"
  end
end
