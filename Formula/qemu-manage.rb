class QemuManage < Formula
  desc "Single-binary CLI for managing headless AArch64 QEMU VMs on Apple Silicon"
  homepage "https://github.com/bradsjm/qemu-manage"
  url "https://github.com/bradsjm/qemu-manage/releases/download/v0.4.0/qemu-manage_0.4.0_darwin_arm64.tar.gz"
  version "0.4.0"
  sha256 "f136781296d18dffd3ef3884c5ae7078a09d3658f98759a9b3b3914dbe76b186"
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
