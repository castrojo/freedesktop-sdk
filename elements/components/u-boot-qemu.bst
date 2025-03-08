kind: make

build-depends:
- components/bison.bst
- components/flex.bst
- components/gzip.bst
- components/bc.bst
- components/swig.bst
- components/python3-setuptools.bst
- components/util-linux.bst
- components/gnutls.bst

depends:
- bootstrap-import.bst
- components/openssl.bst

variables:
  notparallel: true
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
  install-commands:
  - install -Dm644 -t "%{install-root}%{datadir}/u-boot/%{board}" u-boot.bin
  - install -Dm755 -t "%{install-root}%{bindir}" tools/mkimage

sources:
- kind: git_repo
  url: denx:u-boot/u-boot.git
  track: v*
  exclude:
  - "*rc*"
  ref: v2025.01-0-g6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72
- kind: patch
  path: patches/u-boot/riscv-pre-load-fdt.patch
