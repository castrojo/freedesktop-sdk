kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/python3-minimal.bst
- components/u-boot-qemu.bst
- components/dtc.bst

variables:
  board: "none"
  (?):
  - target_arch == "riscv64":
      board: k1
  make-args: >-
    O=build-generic
    PLATFORM=generic
    PLATFORM_DEFCONFIG=%{board}_defconfig
    MKIMAGE="%{bindir}/mkimage"

config:
  build-commands:
    (<):
    - |
      if [ "%{board}" == "none" ]; then
        echo "Unsupported arch, use opensbi-spacemit-k1-maybe"
        exit 1
      fi
  install-commands:
    # NOTE: temporary workaround to install .itb FIT firmware.
    # TODO: Try to use generic .bin firmware, likely embedding it into u-boot .itb image
  - install -Dm644 "%{build-root}/build-generic/platform/generic/firmware/fw_dynamic.itb" "%{install-root}/usr/share/opensbi/lp64/generic/firmware/fw_dynamic.itb"

sources:
- kind: git_repo
  url: github:BPI-SINOVOIP/pi-opensbi.git
  track: v1.3-k1-v2.0
  ref: 70addf7d31eb7b00cf5ed1e07761927a4a3c2033
