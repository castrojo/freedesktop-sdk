# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU autoconf

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst

depends:
- components/gawk.bst
- public-stacks/runtime-minimal.bst
- components/grep.bst
- components/sed.bst
- components/symlinks.bst
- components/m4.bst
- components/perl.bst
- components/utf-locale.bst

runtime-depends:
- components/gettext.bst

sources:
- kind: tar
  url: ftp_gnu_org:autoconf/autoconf-2.73.tar.xz
  ref: 9fd672b1c8425fac2fa67fa0477b990987268b90ff36d5f016dae57be0d6b52e
