kind: autotools

build-depends:
- bootstrap/base-sdk/automake.bst
- bootstrap/base-sdk/flex.bst
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/m4.bst
- bootstrap/base-sdk/perl.bst

(@):
- elements/bootstrap/include/base-sdk.yml

environment:
  AUTOPOINT: true

variables:
  conf-local: --disable-nls

config:
  install-commands:
    (>):
    - |
      find "%{install-root}" -name "lib*.a" -delete

sources:
- kind: tar
  url: ftp_gnu_org:bison/bison-3.8.2.tar.gz
  ref: 06c9e13bdf7eb24d4ceb6b59205a4f67c2c7e7213119644430fe82fbd14a0abb
