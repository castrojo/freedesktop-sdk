# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/libabigail.bst
- components/libdrm.bst
- extensions/mesa/libdrm.bst

config:
  commands:
  - abidiff --no-added-syms '%{libdir}/libdrm.so' '%{libdir}/GL/default/lib/libdrm.so.2'
