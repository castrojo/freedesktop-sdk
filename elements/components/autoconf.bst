# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU autoconf

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst -> _private/python3-minimal.bst.
# So we have to use bootstrap/ elements in build-depends, and we cannot
# use public-stacks/runtime-minimal.bst in runtime-depends.

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst
- bootstrap/symlinks.bst
- components/m4.bst
- components/perl.bst
- components/utf-locale.bst

runtime-depends:
- components/gettext.bst
- components/gawk.bst
- components/grep.bst
- components/sed.bst
- components/symlinks.bst
- components/m4.bst
- components/perl.bst
- components/utf-locale.bst
#- public-stacks/runtime-minimal.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.73.tar.xz
  ref: 9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e
