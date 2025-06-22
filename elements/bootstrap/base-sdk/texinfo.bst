kind: autotools
description: GNU texinfo

(@):
- elements/bootstrap/include/base-sdk.yml
- elements/include/texinfo-source.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/perl.bst

variables:
  conf-local: |
    PERL_EXT_CFLAGS="$CFLAGS" \
    PERL_EXT_LDFLAGS="$LDFLAGS"
