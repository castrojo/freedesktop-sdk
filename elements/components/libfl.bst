# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/flex-base.bst

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

config:
  include:
  - libfl
