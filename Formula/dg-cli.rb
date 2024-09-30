class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "1.5.0"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-1.5.0.tar.gz", :using => :curl
  sha256 "30ed0016296dbde17d2fbd3b90be019f2b950051d6f445e810d84ee768ba5c34"

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
    assert_equal version_text, "dg 1.5.0"
  end
end
