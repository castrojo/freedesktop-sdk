kind: autotools
description: pkg-config

depends:
- filename: bootstrap-import.bst
- filename: components/autoconf.bst
  type: build
- filename: components/automake.bst
  type: build
- filename: components/libtool.bst
  type: build

config:
  install-commands:
    (>):
    - |
      ln -s pkgconf "%{install-root}%{bindir}/pkg-config"
      ln -s pkgconf.1 "%{install-root}%{mandir}/man1/pkg-config.1"

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpkgconf.so'

sources:
- kind: git_tag
  url: github:pkgconf/pkgconf.git
  track: master
  match:
  - pkgconf-1.8.*
  ref: pkgconf-1.8.0-0-gcef30268e1a3f79efd607c26abcf556aa314c9c4
