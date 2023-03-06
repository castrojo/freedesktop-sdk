kind: autotools
description: GNU coreutils

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/coreutils-source.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst

environment:
  FORCE_UNSAFE_CONFIGURE: 1

variables:
  conf-local: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages

config:
  install-commands:
  - |
    cd "%{build-dir}"
    make -j1 install-man DESTDIR="%{install-root}"
