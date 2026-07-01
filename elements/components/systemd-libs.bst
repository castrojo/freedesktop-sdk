# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/systemd-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst
- components/libgcrypt.bst
- components/systemd-manifest.bst
- components/lz4.bst
- components/zstd.bst

config:
  include:
  - systemd-libs
  - systemd-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsystemd.so'
        - '%{libdir}/libudev.so'
    overlap-whitelist:
    - "%{project_licensedir}/systemd"
    - "%{project_licensedir}/systemd/**"
