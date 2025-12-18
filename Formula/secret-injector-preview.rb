class SecretInjectorPreview < Formula
  desc "Inject Azure Key Vault secrets into configuration files"
  homepage "https://github.com/DigitecGalaxus/Dg.ContainerDevelopment"

  version "1.0.0"

  on_intel do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_1.0.0_darwin_amd64.tar.gz", using: :curl
    sha256 "52b510ba4fee8ebd0d6d024efb0e30c7133c1397d1e30c7f8584b215b43c2c9f"
  end

  on_arm do
    url "https://dg-package-repositories.platform.prod.int.devinite.com/dg-secret-injector/mac/dg-secret-injector_1.0.0_darwin_arm64.tar.gz", using: :curl
    sha256 "128c6083c530c8baba30e0ca53615b6e55b66ec0055c4004c238b99e099a8776"
  end

  conflicts_with "secret-injector", because: "cannot be installed at the same time as `secret-injector`"

  def install
    bin.install "secret-injector"
  end

  def post_install
    system "xattr", "-rd", "com.apple.quarantine", "#{bin}/secret-injector"
  end
end
