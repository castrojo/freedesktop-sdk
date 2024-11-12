kind: autotools
description: pkg-config

build-depends:
- public-stacks/buildsystem-make.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst

depends:
- public-stacks/runtime-minimal.bst

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
