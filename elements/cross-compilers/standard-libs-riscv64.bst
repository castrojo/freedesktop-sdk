# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
build-depends:
- cross-compilers/standard-libs-riscv64-compose.bst

config:
  include:
  - arch
  include-orphans: False
