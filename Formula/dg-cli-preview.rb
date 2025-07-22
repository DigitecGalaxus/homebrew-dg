class DgCliPreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.6.16-b.4"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.6.16-b.4.tar.gz", :using => :curl
  sha256 "f8b65590d0f2d19f5eda427b75e2524d9d64a75c6d40fa05f3a629f48f10b5a9"

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
