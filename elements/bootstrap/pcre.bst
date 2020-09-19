kind: autotools
description: pcre

build-depends:
- bootstrap/gnu-config.bst
- bootstrap/build/gcc-stage2.bst
- bootstrap/build/debug-utils.bst
- filename: bootstrap/glibc.bst
  config:
    location: "%{sysroot}"

runtime-depends:
- bootstrap/glibc.bst

(@): elements/bootstrap/include/target.yml

variables:
  conf-local: >-
    --enable-unicode-properties

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/pcre-config'
        - '%{libdir}/libpcre.so'
        - '%{libdir}/libpcrecpp.so'
        - '%{libdir}/libpcreposix.so'

sources:
- kind: tar
  url: tar_https:ftp.pcre.org/pub/pcre/pcre-8.44.tar.bz2
  ref: 19108658b23b3ec5058edc9f66ac545ea19f9537234be1ec62b714c84399366d
