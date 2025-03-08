kind: make

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
  (?):
  - target_arch == "riscv64":
      board: sifive_unmatched
  make-args: >-
    %{board}_defconfig
    all

config:
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin spl/u-boot-spl.bin u-boot.itb
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_repo
  url: denx:u-boot/u-boot.git
  track: v*
  exclude:
  - "*-rc*"
  ref: v2025.01-0-g6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72
- kind: patch
  # This patch is a hack for vm/firmware/bootloader-unmatched.bst
  # The DTB from U-Boot is not in sync with the one from the kernel
  # So we need to load the kernel DTB from a special partition to
  # override the DTB from U-Boot
  path: patches/u-boot/unmatched-dtb.patch
