class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.5.0/qemu-manage_0.5.0_darwin_arm64.tar.gz"
  version "0.5.0"
  sha256 "710910c14e2c84c1785a2cf8d78addc79257d66841bd0f4055c6636712c9e3cd"
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
    assert_match "repository: #{homepage}", output
  end
end
