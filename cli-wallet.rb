class CliWallet < Formula
  desc "A command-line interface based Ethereum wallet with token and smart contract support"
  homepage "https://github.com/daxchain-io/cli-wallet"
  url "https://github.com/daxchain-io/cli-wallet/archive/refs/tags/v0.0.10.tar.gz"
  sha256 "e29298a6b059bc813a7f91523235e6f9843a946733c1f8235e1c58ed8b438934"
  
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
