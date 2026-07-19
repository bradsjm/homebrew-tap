class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.3.0/qemu-manage_0.3.0_darwin_arm64.tar.gz"
  version "0.3.0"
  sha256 "343b7309341397d39f76dd54c72ef50c7cd5cc8bb003e6b7fe11c3dbac047153"
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
