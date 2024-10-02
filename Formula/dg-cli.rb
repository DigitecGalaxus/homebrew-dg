class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.0.0"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.0.0.tar.gz", :using => :curl
  sha256 "1697f1b81a9de139eb6a7d5b299285357df0cfae188aa2a551e805b6e12c22d2"

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
    assert_equal version_text, "dg 2.0.0"
  end
end
