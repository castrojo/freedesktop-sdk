kind: make

build-depends:
- bootstrap-import.bst
- components/u-boot-qemu.bst

variables:
  notparallel: true
  make-args: >-
    O=build-generic
    PLATFORM=generic
    FW_PAYLOAD_PATH="/usr/share/u-boot/qemu-riscv64_smode/u-boot.bin"

  make-install: make -j1 %{make-args} install_root_dir="%{install-root}%{prefix}"

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: master
  ref: v1.1-0-g4489876e933d8ba0d8bc6c64bae71e295d45faac
