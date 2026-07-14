# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- components/os-release.bst
- sdk.bst
- vm/mesa-default.bst

config:
  exclude:
  - sysconf
  - extra
  - vm-only
  - tests
  - shells
