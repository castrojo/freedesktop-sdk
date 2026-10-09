# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU automake

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst. So we have to use bootstrap/
# elements in build-depends, and we cannot use public-stacks/runtime-minimal.bst
# in runtime-depends.

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/m4.bst

runtime-depends:
#- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/perl.bst
- components/utf-locale.bst

sources:
- kind: tar
  url: ftp_gnu_org:automake/automake-1.18.1.tar.xz
  ref: 168aa363278351b89af56684448f525a5bce5079d0b6842bd910fdd3f1646887
