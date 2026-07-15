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
  ref: gawk-5.4.0-0-gc86b958ce5d651147d39eb147c439dae1dbfd949
