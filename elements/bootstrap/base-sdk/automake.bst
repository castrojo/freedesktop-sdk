kind: autotools
description: GNU automake

(@):
- elements/bootstrap/include/base-sdk.yml

build-depends:
- bootstrap/gnu-config.bst

depends:
- bootstrap/base-sdk/autoconf.bst

sources:
- kind: tar
  url: ftp_gnu_org:automake/automake-1.17.tar.xz
  ref: 8920c1fc411e13b90bf704ef9db6f29d540e76d232cb3b2c9f4dc4cc599bd990
