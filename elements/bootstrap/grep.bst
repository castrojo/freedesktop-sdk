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
  url: ftp_gnu_org:grep/grep-3.7.tar.xz
  ref: 5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c
