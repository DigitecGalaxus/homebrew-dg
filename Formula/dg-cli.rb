class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "1.13.45"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-1.13.45.tar.gz", :using => :curl
  sha256 "d34a83b7b4279da81f321a683c4b3ff4f205fb3f3e03cbdf36be3227b4407118"

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
    assert_equal version_text, "dg 1.13.45"
  end
end
