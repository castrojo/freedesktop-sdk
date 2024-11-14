kind: make

description: |
  This element should be consumed through u-boot-spacemit-k1-maybe.bst
  as this is specific to riscv. The board variable is set as a stub
  to enable tracking

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/opensbi-spacemit-k1.bst
- components/dtc.bst
- components/python3.bst
- components/python3-setuptools.bst
- components/swig.bst
- components/gnutls.bst

variables:
  notparallel: true
  board: "none"
  (?):
  - target_arch == "riscv64":
      board: k1
  make-args: >-
    %{board}_defconfig
    all

config:
  build-commands:
    (<):
    - |
      if [ "%{board}" == "none" ]; then
        echo "Unsupported arch, use u-boot-spacemit-k1-maybe"
        exit 1
      fi

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" *.bin u-boot.itb

sources:
- kind: git_repo
  url: github:BPI-SINOVOIP/pi-u-boot.git
  track: v2022.10-k1-v2.0
  ref: 7113d1689bda8baf6763da73d9b10d2926b377c7
- kind: patch_queue
  path: patches/u-boot-spacemit-k1
