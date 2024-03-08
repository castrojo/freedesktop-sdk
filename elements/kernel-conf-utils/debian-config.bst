kind: manual

build-depends:
- bootstrap-import.bst

variables:
  kernel-arch: "%{arch}"
  debian-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      kernel-arch: x86
      debian-arch: amd64
  - target_arch == "aarch64":
      kernel-arch: arm64
  - target_arch == "i686":
      kernel-arch: i386
  - target_arch in ("ppc64", "ppc64le"):
      kernel-arch: powerpc
  - target_arch == "riscv64":
      kernel-arch: riscv

  configs: >-
    kernelarch-%{kernel-arch}/config
    %{debian-arch}/config
    config

config:
  build-commands:
  - |
    cd debian/config
    for conffile in %{configs}; do
      if [ -r "${conffile}" ]; then
        cat "${conffile}"
      fi
    done >debian-config

  install-commands:
  - |
    install -Dm644 -t '%{install-root}' debian/config/debian-config

sources:
- kind: git_repo
  url: debian_salsa:kernel-team/linux.git
  # It's intended to not have a pinned ref, as this module is only
  # for local utility and you are expected to track every time you
  # need to use it.
  track: master
