kind: autotools
description: pcre

depends:
- bootstrap-import.bst

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
  url: pcre:pcre-8.45.tar.bz2
  ref: 4dae6fdcd2bb0bb6c37b5f97c33c2be954da743985369cddac3546e3218bffb8
