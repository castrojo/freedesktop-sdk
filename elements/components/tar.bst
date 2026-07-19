# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

(@):
- elements/include/tar-source.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/findutils.bst
- bootstrap/gawk.bst
- bootstrap/gcc.bst
- bootstrap/grep.bst
- bootstrap/make.bst
- bootstrap/sed.bst
- bootstrap/stripper.bst

depends:
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst
