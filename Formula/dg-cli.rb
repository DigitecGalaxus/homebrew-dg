class DgCli < Formula
  desc "Digitec Galaxus CLI"
  homepage "https://www.galaxus.ch"
  version "2.1.4"
  url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.1.4.tar.gz", :using => :curl
  sha256 "ecbaf8ed410df12ff4096101a99e7207437d6e6de32aa6a002fe37ad137915ec"

  # other versions
  version "2.2.0-beta1" do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/DGCLI/mac/dg-cli-2.2.0-beta1.tar.gz", :using => :curl
    sha256 "97093293210f01169c65385c07c3192736c4a564f23b6dca43913fb9369ef12d"
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
