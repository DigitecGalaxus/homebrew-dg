class SecretInjectorPreview < Formula
  desc "Inject Azure Key Vault secrets into configuration files"
  homepage "https://github.com/DigitecGalaxus/Dg.ContainerDevelopment"

  version "0.0.0"

  on_intel do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_0.0.0_darwin_amd64.tar.gz", using: :curl
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_arm do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_0.0.0_darwin_arm64.tar.gz", using: :curl
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  conflicts_with "secret-injector", because: "cannot be installed at the same time as `secret-injector`"

  def install
    bin.install "secret-injector"
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{bin}/secret-injector"
  end
end
