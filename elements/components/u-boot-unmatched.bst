kind: manual

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/opensbi.bst
- components/dtc.bst

environment:
  OPENSBI: /usr/share/opensbi/lp64/generic/firmware/fw_dynamic.bin

variables:
  (?):
  - target_arch == "riscv64":
      board: sifive_hifive_unmatched_fu740

config:
  configure-commands:
  - make "%{board}_defconfig"

  build-commands:
  - make V=1 all

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin spl/u-boot-spl.bin u-boot.itb
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_repo
  url: git_https:gitlab.denx.de/u-boot/u-boot.git
  track: v*
  exclude:
  - "*-rc*"
  ref: v2021.04-0-gb46dd116ce03e235f2a7d4843c6278e1da44b5e1
- kind: patch
  path: patches/u-boot/efi-partition-signature.patch
- kind: patch_queue
  path: patches/sifive-unmatched/u-boot
- kind: patch
  # This patch is a hack for vm/firmware/bootloader-unmatched.bst
  # The DTB from U-Boot is not in sync with the one from the kernel
  # So we need to load the kernel DTB from a special partition to
  # override the DTB from U-Boot
  path: patches/u-boot/unmatched-dtb.patch
