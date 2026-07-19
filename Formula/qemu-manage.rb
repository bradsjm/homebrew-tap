class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.2.0/qemu-manage_0.2.0_darwin_arm64.tar.gz"
  version "0.2.0"
  sha256 "1646076c332b2f07641a517281cf1846a31faa4b5c1bc5478c99845a4f1bb3de"
  license "Apache-2.0"

  depends_on "qemu"
  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "qemu-manage"
  end

  test do
    output = shell_output("#{bin}/qemu-manage --version")
    assert_match "qemu-manage #{version}", output
    assert_match "repository: #{homepage}", output
  end
end
