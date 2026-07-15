# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/lvm2-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/systemd-libs.bst

config:
  include:
  - libdevmapper
  include-orphans: False

public:
  bst:
    split-rules:
      devel:
      - '%{libdir}/libdevmapper.so'
