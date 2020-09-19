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
  url: ftp_gnu_org:grep/grep-3.8.tar.xz
  ref: 498d7cc1b4fb081904d87343febb73475cf771e424fb7e6141aff66013abc382
