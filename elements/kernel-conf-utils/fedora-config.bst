kind: manual

build-depends:
- bootstrap-import.bst

variables:
  kernel-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      kernel-arch: x86
  - target_arch == "aarch64":
      kernel-arch: arm64
  - target_arch == "i686":
      kernel-arch: i386
  - target_arch in ("ppc64", "ppc64le"):
      kernel-arch: powerpc
  - target_arch == "riscv64":
      kernel-arch: riscv

  configs: >-
    common/generic
    common/generic/%{kernel-arch}
    fedora/generic
    fedora/generic/%{kernel-arch}

config:
  build-commands:
  - |
    shopt -s nullglob
    cd redhat/configs
    for confdir in %{configs}; do
      cat "${confdir}"/CONFIG_*
    done >fedora-config
    shopt -u nullglob

  install-commands:
  - |
    install -Dm644 -t '%{install-root}' redhat/configs/fedora-config

sources:
- kind: git_tag
  url: gitlab:cki-project/kernel-ark.git
  track: os-build
  ref: kernel-6.1.0-0.rc0.2bca25eaeba6.2-0-ge5960dc4be8c0bd9f37ddbf3fa7099600d7167a1
