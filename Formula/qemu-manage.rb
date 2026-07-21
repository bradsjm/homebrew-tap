class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.6.1/qemu-manage_0.6.1_darwin_arm64.tar.gz"
  version "0.6.1"
  sha256 "7cd1c2652247aafa359b3436aebbc0a605e34eca49b2c4a52c1ab70aad645159"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :ventura
  depends_on "qemu"

  def install
    bin.install "qemu-manage"
  end

  test do
    output = shell_output("#{bin}/qemu-manage --version")
    assert_match "qemu-manage #{version}", output
    assert_match homepage, output
  end
end
