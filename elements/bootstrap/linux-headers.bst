kind: manual
description: GNU linux headers stage 1

build-depends:
- bootstrap/build/rsync.bst

(@):
- elements/bootstrap/include/common.yml

variables:
  kernel_arch: '%{arch}'
  (?):
  - target_arch == "aarch64":
      kernel_arch: arm64
  - target_arch == "i686":
      kernel_arch: i386
  - target_arch == "loongarch64":
      kernel_arch: loongarch
  - target_arch == "ppc64le" or target_arch == "ppc64":
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


# This is by intent separate source than actual Linux. Even though
# we want latest kernel versions, linux-headers are commonly
# unchanged and updating them results in world rebuild
sources:
- kind: git_repo
  url: kernel:linux/kernel/git/stable/linux.git
  track: v6.1.10
  exclude:
  - '*-rc*'
  ref: v6.1.10-0-g17d99ea98b6238e7e483fba27e8f7a7842d0f345
