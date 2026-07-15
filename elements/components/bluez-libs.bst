# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/bluez-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/bluez-manifest.bst

config:
  include:
  - bluez-libs
  - bluez-license

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libbluetooth.so'
    overlap-whitelist:
    - "%{project_licensedir}/bluez"
    - "%{project_licensedir}/bluez/**"
