# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/flex-base.bst

runtime-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/libfl.bst
- components/m4.bst
- components/utf-locale.bst

config:
  exclude:
  - libfl
