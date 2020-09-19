kind: autotools
description: GNU grep

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"
- filename: bootstrap/pcre.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst
- bootstrap/pcre.bst

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
  url: ftp_gnu_org:grep/grep-3.3.tar.xz
  ref: b960541c499619efd6afe1fa795402e4733c8e11ebf9fafccc0bb4bccdc5b514
