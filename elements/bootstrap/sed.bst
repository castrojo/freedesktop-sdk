kind: autotools
description: GNU sed

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
- kind: anitya
  project-id: 4789
  url: ftp_gnu_org:sed/sed-{version}.tar.xz
  ref:
    version: '4.9'
    sha256sum: 6e226b732e1cd739464ad6862bd1a1aba42d7982922da7a53519631d24975181
