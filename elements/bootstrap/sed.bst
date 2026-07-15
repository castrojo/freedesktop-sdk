# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU sed

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
- kind: tar
  url: ftp_gnu_org:sed/sed-4.10.tar.xz
  ref: b8e72182b2ec96a3574e2998c47b7aaa64cc20ce000d8e9ac313cc07cecf28c7
