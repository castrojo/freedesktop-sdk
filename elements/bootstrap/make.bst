# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools
description: GNU make

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/gettext.bst
- bootstrap/base-sdk/pkg-config.bst
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
  configure-commands:
    (<):
    - |
      autoreconf -fvi

  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: anitya
  project-id: 1877
  url: ftp_gnu_org:make/make-{version}.tar.lz
  ref:
    version: 4.4.1
    sha256sum: 8814ba072182b605d156d7589c19a43b89fc58ea479b9355146160946f8cf6e9
