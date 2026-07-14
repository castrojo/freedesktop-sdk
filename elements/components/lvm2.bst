# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/lvm2-base.bst

runtime-depends:
- components/libaio.bst
- components/libdevmapper.bst
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

config:
  exclude:
  - libdevmapper
  include-orphans: True
