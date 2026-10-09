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
- bootstrap/symlinks.bst
- components/utf-locale.bst

runtime-depends:
#- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/utf-locale.bst
