kind: autotools
description: GNU ncurses stage 1

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/ncurses-sources.yml

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

variables:
  conf-link-args: --without-shared
  conf-local: |
    --without-ada \
    --with-normal \
    --enable-widec
