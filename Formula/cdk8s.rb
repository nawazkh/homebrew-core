require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.32.tgz"
  sha256 "81562b122ec19ff587a4943535088f5f2ba07e84cba3ecd91e47e7f829fb1c4c"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "8903dbc113fc28af2858492b3b3c2bea4a0438ea4d25957d27fc1e2bbc8c25df"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
