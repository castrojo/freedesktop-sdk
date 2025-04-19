kind: manual

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/swig.bst
- components/python3-setuptools.bst
- components/util-linux.bst
- components/gnutls.bst

variables:
  (?):
  - target_arch == "x86_64":
      board: qemu-x86_64
  - target_arch == "aarch64":
      board: qemu_arm64
  - target_arch == "riscv64":
      board: qemu-riscv64_smode

config:
  configure-commands:
  - make "%{board}_defconfig"

  build-commands:
  - make V=1 all

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_repo
  url: denx:u-boot/u-boot.git
  track: v*
  exclude:
  - "*rc*"
  ref: v2025.04-0-g34820924edbc4ec7803eb89d9852f4b870fa760a
- kind: patch
  path: patches/u-boot/riscv-pre-load-fdt.patch
