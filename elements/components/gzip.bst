kind: autotools
description: GNU zip

build-depends:
- bootstrap/bootstrap.bst

depends:
- bootstrap/bootstrap-base.bst

(?):
- target_arch == "i686":
    variables:
      conf-local: TIME_T_32_BIT_OK=yes

sources:
- kind: tar
  url: ftp_gnu_org:gzip/gzip-1.13.tar.xz
  ref: 7454eb6935db17c6655576c2e1b0fabefd38b4d0936e0f87f48cd062ce91a057
