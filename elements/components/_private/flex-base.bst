# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst -> flex.bst.
# So we have to use bootstrap/ elements in build-depends, and we cannot
# use public-stacks/runtime-minimal.bst in runtime-depends.

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/gcc.bst
- bootstrap/make.bst
- bootstrap/stripper.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst
- components/m4.bst
- components/tar.bst
- components/texinfo.bst

runtime-depends:
#- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/utf-locale.bst

config:
  configure-commands:
    (<):
    - |
      ./autogen.sh

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

public:
  bst:
    split-rules:
      libfl:
      - '%{libdir}/libfl.so.*'
  cpe:
    product: flex

sources:
- kind: tar
  url: github_files:westes/flex/files/981163/flex-2.6.4.tar.gz
  ref: e87aae032bf07c26f85ac0ed3250998c37621d95f8bd748b31f15b33c45ee995
- kind: patch
  path: patches/flex/flex-pie.patch
