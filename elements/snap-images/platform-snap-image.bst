# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- components/os-release.bst
- platform.bst
- vm/mesa-default.bst

config:
  exclude:
  - sysconf
  - devel
  - extra
  - vm-only
  - tests
  - shells
