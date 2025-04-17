kind: autotools
description: static version of libuuid used to compile recc

build-depends:
- public-stacks/buildsystem-make.bst
- components/autoconf.bst
- components/automake.bst
- components/libtool.bst

variables:
  conf-local: >-
    --disable-all-programs
    --without-python
    --enable-libuuid
    --enable-static
    --disable-shared

config:
  install-commands:
    (>):
    - rmdir %{install-root}%{prefix}/sbin

(@):
- elements/include/util-linux-source.yml
