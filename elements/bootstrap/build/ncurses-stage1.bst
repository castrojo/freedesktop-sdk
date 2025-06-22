kind: autotools
description: GNU ncurses stage 1

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/ncurses-sources.yml

build-depends:
- bootstrap/base-sdk/binary-seed.bst
- bootstrap/gnu-config.bst

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
