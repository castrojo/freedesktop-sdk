# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU awk

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/debug-utils.bst
- bootstrap/build/gcc-stage2.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

- bootstrap/gnu-config.bst

runtime-depends:
- bootstrap/glibc.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{bindir}"/gawk-*

    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: git_repo
  url: savannah:gawk.git
  track: gawk-*
  exclude:
  - '*-docs'
  ref: gawk-5.4.1-0-g52af7f12758da12db0ddbdb117a84e0685cd2f72
- kind: patch
  path: patches/gawk/0001-Workaround-fix-for-systems-without-MPFR-and-GMP.patch
