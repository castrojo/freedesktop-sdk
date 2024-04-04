kind: manual

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst

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
  url: https://gitlab.denx.de/u-boot/u-boot.git
  track: v*
  exclude:
  - "*-rc*"
  ref: v2021.04-0-gb46dd116ce03e235f2a7d4843c6278e1da44b5e1
- kind: patch
  path: patches/u-boot/riscv-pre-load-fdt.patch
- kind: patch
  path: patches/u-boot/efi-partition-signature.patch
