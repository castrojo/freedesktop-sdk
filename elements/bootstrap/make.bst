kind: autotools
description: GNU make

build-depends:
- bootstrap/make-build-deps.bst

runtime-depends:
- bootstrap/glibc.bst

(@): elements/bootstrap/include/target.yml

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
- kind: tar
  url: ftp_gnu_org:make/make-4.3.tar.lz
  ref: de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82
