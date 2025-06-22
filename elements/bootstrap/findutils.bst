kind: autotools
description: GNU findutils

(@):
- elements/bootstrap/include/target.yml

build-depends:
- bootstrap/base-sdk/texinfo.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- bootstrap/gnu-config.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

config:
  install-commands:
    (>):
    - |
      rm "%{install-root}%{infodir}/dir"

sources:
- kind: tar
  url: ftp_gnu_org:findutils/findutils-4.10.0.tar.xz
  ref: 1387e0b67ff247d2abde998f90dfbf70c1491391a59ddfecb8ae698789f0a4f5
- kind: patch
  path: patches/findutils/no-locate.patch
