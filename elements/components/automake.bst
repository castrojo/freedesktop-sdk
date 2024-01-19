kind: autotools
description: GNU automake

build-depends:
- bootstrap/bootstrap.bst
- components/help2man.bst

depends:
- bootstrap/bootstrap-base.bst
- components/autoconf.bst

sources:
- kind: tar
  url: ftp_gnu_org:automake/automake-1.16.5.tar.xz
  ref: f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469
