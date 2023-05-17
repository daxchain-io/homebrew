class CliWallet < Formula
  desc "A command-line interface based Ethereum wallet with token and smart contract support"
  homepage "https://github.com/daxchain-io/cli-wallet"
  url "https://github.com/daxchain-io/cli-wallet/archive/refs/tags/v0.0.0.tar.gz"
  sha256 "0178a246efe4d7c5beda8c2dbedde1dab41a12de7a64d4d589c1683cc9023b99"
  
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/daxchain-io/cli-wallet").install buildpath.children
    cd "src/github.com/daxchain-io/cli-wallet" do
      system "go", "build", "-o", bin/"wallet", "."
    end
  end

  test do
    assert_match "version", shell_output("#{bin}/wallet --version")
  end
end
