kind: make

build-depends:
- bootstrap-import.bst
- components/u-boot-qemu.bst

variables:
  make-args: >-
    O=build-generic
    PLATFORM=generic
    FW_PAYLOAD_PATH="/usr/share/u-boot/qemu-riscv64_smode/u-boot.bin"

config:
  build-commands:
  - |
    make %{make-args}

  install-commands:
  - |
    make -j1 install %{make-args} install_root_dir="%{install-root}%{prefix}"

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: v*
  ref: v1.1-0-g4489876e933d8ba0d8bc6c64bae71e295d45faac
