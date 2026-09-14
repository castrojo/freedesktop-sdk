# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: autotools

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

variables:
  conf-local: >-
    gl_cv_func_getopt_gnu=yes
    gl_cv_func_strcasecmp_works=yes

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: anitya
  project-id: 436
  url: ftp_gnu_org:diffutils/diffutils-{version}.tar.xz
  ref:
    version: 3.12
    sha256sum: 7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd
