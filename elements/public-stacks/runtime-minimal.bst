# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Minimal runtime stack.

  The elements listed here are runtime-depends of every element build in FDSDK.

  This stack is as small as we can make it: just the root filesystem layout, GNU
  C library and GNU C/C++/Fortran/Objective-C support libraries.

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/gcc-libs.bst
- components/utf-locale.bst
