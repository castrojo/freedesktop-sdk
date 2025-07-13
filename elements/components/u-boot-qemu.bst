kind: make

description: |
  This element should be consumed through u-boot-qemu-maybe.bst
  as this is specific to select arches. The board variable is set as
  a stub to enable tracking

build-depends:
- public-stacks/buildsystem-make.bst
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/swig.bst
- components/python3-setuptools.bst
- components/util-linux.bst
- components/gnutls.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst

variables:
  notparallel: true
  board: "none"
  (?):
  - target_arch == "x86_64":
      board: qemu-x86_64
  - target_arch == "aarch64":
      board: qemu_arm64
  - target_arch == "riscv64":
      board: qemu-riscv64_smode
  make-args: >-
    %{board}_defconfig
    all

config:
  build-commands:
    (<):
    - |
      if [ "%{board}" == "none" ]; then
        echo "Unsupported arch, use u-boot-qemu-maybe"
        exit 1
      fi

  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_repo
  url: github:u-boot/u-boot.git
  track: v*
  exclude:
  - "*rc*"
  ref: v2025.07-0-ge37de002fac3895e8d0b60ae2015e17bb33e2b5b
- kind: patch
  path: patches/u-boot/riscv-pre-load-fdt.patch
