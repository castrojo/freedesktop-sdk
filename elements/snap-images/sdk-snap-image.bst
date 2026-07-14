# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

config:
  exclude:
  - sysconf
  - extra
  - vm-only
  - tests
  - shells

build-depends:
- sdk.bst
- components/os-release.bst
- vm/mesa-default.bst
