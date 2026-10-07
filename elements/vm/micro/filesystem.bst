# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- vm/micro/deps.bst

config:
  exclude:
  - debug
  - devel
  - doc
  - license
  - locale
  - tests
  - shells
  include-orphans: True
