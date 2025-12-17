class SecretInjectorPreview < Formula
  desc "Inject Azure Key Vault secrets into configuration files"
  homepage "https://github.com/DigitecGalaxus/Dg.ContainerDevelopment"

  version "0.0.2"

  on_intel do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_0.0.2_darwin_amd64.tar.gz", using: :curl
    sha256 "4d2347a7cf2d8d4000b0863c63213caea747541adbba819512fb0e9f6d873312"
  end

  on_arm do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_0.0.2_darwin_arm64.tar.gz", using: :curl
    sha256 "86223a795ae057721da9636c11ac219e88e58acccf2d325876dd93fa8b47f64f"
  end

  conflicts_with "secret-injector", because: "cannot be installed at the same time as `secret-injector`"

  def install
    bin.install "secret-injector"
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{bin}/secret-injector"
  end
end
