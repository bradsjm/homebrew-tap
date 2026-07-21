class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.6.0/qemu-manage_0.6.0_darwin_arm64.tar.gz"
  version "0.6.0"
  sha256 "89b9ae09bcf7e46a922c389839c96329af2daa7d65aa5a2de392a9dad77a9986"
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
