kind: manual
description: GNU linux headers stage 1

build-depends:
- bootstrap/build/base-sdk.bst
- bootstrap/build/rsync.bst

(@):
- elements/bootstrap/include/target.yml
- elements/include/linux.yml

variables:
  kernel_arch: '%{arch}'
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch == "ppc64le":
      kernel_arch: powerpc
  - target_arch == "riscv64" or target_arch == "riscv32":
      kernel_arch: riscv

config:
  install-commands:
  - make ARCH="%{kernel_arch}" INSTALL_HDR_PATH="%{install-root}%{prefix}" headers_install
  - |
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/linux"
    mkdir -p "%{install-root}%{includedir}/%{gcc_triplet}/asm"
    mv "%{install-root}%{includedir}/asm" \
       "%{install-root}%{includedir}/%{gcc_triplet}/"
    mv "%{install-root}%{includedir}/linux/a.out.h" \
       "%{install-root}%{includedir}/%{gcc_triplet}/linux/" || true
    mv "%{install-root}%{includedir}/linux/kvm_para.h" \
       "%{install-root}%{includedir}/%{gcc_triplet}/linux/" || true

public:
  bst:
    split-rules:
      devel:
      - /**
