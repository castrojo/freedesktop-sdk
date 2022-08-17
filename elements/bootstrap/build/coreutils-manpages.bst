kind: autotools
description: GNU coreutils

(@):
- elements/bootstrap/include/build.yml
- elements/bootstrap/include/coreutils-source.yml

depends:
- filename: bootstrap/build/base-sdk.bst
  type: build

environment:
  FORCE_UNSAFE_CONFIGURE: 1

variables:
  conf-local: |
    --enable-install-program=hostname \
    --mandir=/coreutils-manpages
  make-install-args: install-man DESTDIR="%{install-root}"
