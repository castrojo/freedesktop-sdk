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
  url: ftp_gnu_org:findutils/findutils-4.11.0.tar.xz
  ref: bfd19cb06cc71f3352d567e90284d8cdac02ac89774bbeadf0b533b0c11432fd
- kind: patch
  path: patches/findutils/no-locate.patch
