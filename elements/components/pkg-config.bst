kind: autotools
description: pkg-config

build-depends:
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst

depends:
- bootstrap-import.bst

variables:
  license-element-name: "pkg-config"

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

(@):
- elements/include/pkg-config-source.yml
