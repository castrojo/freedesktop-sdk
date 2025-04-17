kind: autotools
description: static version of libuuid used to compile recc

build-depends:
- components/autoconf.bst
- components/libtool.bst
- components/automake.bst
- components/gcc.bst
- components/make.bst
- components/sed.bst
- components/stripper.bst

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
