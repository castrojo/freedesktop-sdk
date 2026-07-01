# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- oci/layers/flatpak-stack.bst

config:
  exclude:
  - debug
  - doc
  - locale
  - extra
  - static-blocklist
  - vm-only
  - tests
  - shells
