# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/flatpak-minimal.bst
- components/m4.bst

config:
  exclude:
  - devel
  - extra
  - static-blocklist
  - static-allowlist
  - vm-only
  integrate: False
