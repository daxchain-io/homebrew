class CliWallet < Formula
  desc "A command-line interface based Ethereum wallet with token and smart contract support"
  homepage "https://github.com/daxchain-io/cli-wallet"
  url "https://github.com/daxchain-io/cli-wallet/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "703c62492cc77a15eeadeecfd273264e195f92c15942756b3300fc8c91b562f1"
  
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
