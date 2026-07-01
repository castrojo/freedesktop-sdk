# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

description: |
  This element should be consumed through u-boot-unmatched-maybe.bst
  as this is specific to riscv. The board variable is set as a stub
  to enable tracking

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/opensbi.bst
- components/dtc.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/swig.bst
- components/gnutls.bst

environment:
  OPENSBI: /usr/share/opensbi/lp64/generic/firmware/fw_dynamic.bin

variables:
  notparallel: true
  board: "none"
  (?):
  - target_arch == "riscv64":
      board: sifive_unmatched
  make-args: >-
    %{board}_defconfig
    all

config:
  build-commands:
    (<):
    - |
      if [ "%{board}" == "none" ]; then
        echo "Unsupported arch, use u-boot-unmatched-maybe"
        exit 1
      fi

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin spl/u-boot-spl.bin u-boot.itb
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage
  - |
    %{install-extra}

sources:
- kind: git_repo
  url: github:u-boot/u-boot.git
  track: v*
  exclude:
  - "*-rc*"
  ref: v2026.04-0-g88dc2788777babfd6322fa655df549a019aa1e69
- kind: patch
  # This patch is a hack for vm/firmware/bootloader-unmatched.bst
  # The DTB from U-Boot is not in sync with the one from the kernel
  # So we need to load the kernel DTB from a special partition to
  # override the DTB from U-Boot
  path: patches/u-boot/unmatched-dtb.patch
