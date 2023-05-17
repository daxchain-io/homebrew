class CliWallet < Formula
  desc "A command-line interface based Ethereum wallet with token and smart contract support"
  homepage "https://github.com/daxchain-io/cli-wallet"
  url "https://github.com/daxchain-io/cli-wallet/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "ebbe39824ec3bc98a185c2cc8c9387398d610655f7045390aa8a5bf96aa5143f"
  
  bottle do
    root_url "https://github.com/daxchain-io/cli-wallet/releases/download/v0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "your_big_sur_bottle_hash"
    sha256 cellar: :any_skip_relocation, ventura: "your_big_sur_bottle_hash"
    # Include other macOS versions if available
  end

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
