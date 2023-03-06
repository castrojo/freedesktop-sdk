kind: autotools
description: GNU ncurses stage 1

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/ncurses-sources.yml

variables:
  conf-link-args: --without-shared
  conf-local: |
    --without-ada \
    --with-normal \
    --enable-widec
