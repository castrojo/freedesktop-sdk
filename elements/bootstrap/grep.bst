kind: autotools
description: GNU grep

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/pcre2.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/pcre2.bst

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: >-
    --enable-perl-regexp

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:grep/grep-3.12.tar.xz
  ref: 2649b27c0e90e632eadcd757be06c6e9a4f48d941de51e7c0f83ff76408a07b9
