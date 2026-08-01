class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.7.0/qemu-manage_0.7.0_darwin_arm64.tar.gz"
  sha256 "04bb8cd823f8850828da253c316a7f3967711190b8d29d4208a2d10c27d98b86"
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
