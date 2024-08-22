kind: manual

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/swig.bst
- components/python3-setuptools.bst

variables:
  (?):
  - target_arch == "x86_64":
      board: qemu-x86_64
  - target_arch == "aarch64":
      board: qemu-arm64
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
  track: master
  exclude:
  - "*-rc*"
  ref: v2023.04-0-gfd4ed6b7e83ec3aea9a2ce21baea8ca9676f40dd
- kind: patch
  path: patches/u-boot/riscv-pre-load-fdt.patch
