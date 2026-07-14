# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

description: |
  This element should be consumed through opensbi-u-boot-maybe.bst
  as this is specific to arch RISC-V.

build-depends:
- public-stacks/buildsystem-make.bst
- public-stacks/runtime-minimal.bst
- components/dtc.bst
- components/python3.bst
- components/_private/u-boot-qemu.bst

variables:
  notparallel: true
  make-args: >-
    FW_TEXT_START=0x80000000
    FW_PAYLOAD_PATH="/usr/share/u-boot/qemu-riscv64_smode/u-boot.bin"
    O=build-generic
    PLATFORM=generic
  make-install: make -j1 %{make-args} install_root_dir="%{install-root}%{prefix}" install

sources:
- kind: git_repo
  url: github:riscv/opensbi.git
  track: v*.*
  ref: v1.9-0-gcbf9f6734dd85a982c63e3cb5db7ffe09da839ca
