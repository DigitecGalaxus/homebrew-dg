class DgCliATpreview < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.5.2-b.2"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.5.2-b.2.tar.gz", :using => :curl
  sha256 "981b9047ab9f9cc1e77c94bdb114d7155b4d7915b59266b82f07a42d156857d3"

  depends_on "openssl@3"

  keg_only :versioned_formula

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
