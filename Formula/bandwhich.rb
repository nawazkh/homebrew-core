class Bandwhich < Formula
  desc "Terminal bandwidth utilization tool"
  homepage "https://github.com/imsnif/bandwhich"
  url "https://github.com/imsnif/bandwhich/archive/0.13.0.tar.gz"
  sha256 "42b0411c0a9df0b51fa5bedaa5f04fb001fdf46cd2d7ea9a58c98f4f6e7a15d3"

  bottle do
    cellar :any_skip_relocation
    sha256 "310b4b97575f46da8bff2e4e7362c9931f2e29c4e02de76ab81bc304cc3d736d" => :catalina
    sha256 "3a8e1969176673037b44961f650ad659df0214b801210e310a7e245072fbeb1a" => :mojave
    sha256 "62eac4e3da9092103f95e0a43a76959263978df0018f70430eb3f695391143cf" => :high_sierra
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    output = shell_output "#{bin}/bandwhich --interface bandwhich", 2
    assert_match output, "Error: Cannot find interface bandwhich"
  end
end
