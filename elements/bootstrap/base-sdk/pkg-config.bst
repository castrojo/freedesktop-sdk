kind: autotools
description: pkg-config

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/libtool.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/binary-seed.bst

(@):
- elements/bootstrap/include/base-sdk.yml

config:
  install-commands:
    (>):
    - |
      ln -s pkgconf "%{install-root}%{bindir}/pkg-config"
      ln -s pkgconf.1 "%{install-root}%{mandir}/man1/pkg-config.1"

sources:
- kind: git_repo
  url: github:pkgconf/pkgconf.git
  track: master
  ref: pkgconf-1.8.0-0-gcef30268e1a3f79efd607c26abcf556aa314c9c4
