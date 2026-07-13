# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/mandoc.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    PREFIX='%{prefix}'
    EXEC_PREFIX='%{exec_prefix}'
    LIBDIR='%{libdir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    BINDIR='%{bindir}'

sources:
- kind: git_repo
  url: github:rhboot/efivar.git
  track: '[0-9]*'
  ref: 39-0-gc47820c37ac26286559ec004de07d48d05f3308c
- kind: patch_queue
  path: patches/efivar
