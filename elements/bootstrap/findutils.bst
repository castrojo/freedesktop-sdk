# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU findutils

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
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: anitya
  project-id: 812
  url: ftp_gnu_org:findutils/findutils-{version}.tar.xz
  ref:
    version: 4.11.0
    sha256sum: bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd
- kind: patch
  path: patches/findutils/no-locate.patch
