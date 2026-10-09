# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU m4

(@):
- elements/include/m4-source.yml

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

runtime-depends:
- bootstrap/glibc.bst
- components/symlinks.bst
- components/utf-locale.bst

variables:
  # Removal of this is tracked at #2044
  conf-local: >-
    ac_cv_func_posix_spawn_file_actions_addchdir=yes
