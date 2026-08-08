# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU m4

(@):
- elements/include/m4-source.yml

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
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

variables:
  # Removal of this is tracked at #2044
  conf-local: >-
    ac_cv_func_posix_spawn_file_actions_addchdir=yes
