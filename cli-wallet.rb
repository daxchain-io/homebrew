class CliWallet < Formula
  desc "A command-line interface based Ethereum wallet with token and smart contract support"
  homepage "https://github.com/daxchain-io/cli-wallet"
  url "https://github.com/daxchain-io/cli-wallet/archive/refs/tags/v0.0.11.tar.gz"
  sha256 "046a3e742202cb3ce63521c9c430417b1b15c37774b17ca896607c378cade079"
  
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
