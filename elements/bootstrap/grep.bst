kind: autotools
description: GNU grep

depends:
- filename: bootstrap/grep-build-deps.bst
  type: build
- filename: bootstrap/glibc.bst
  type: runtime
- filename: bootstrap/pcre2.bst
  type: runtime

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
