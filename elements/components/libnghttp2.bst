kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst

depends:
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-lib-only
    --disable-openssl

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnghttp2.so'

sources:
- kind: git_repo
  url: github:nghttp2/nghttp2.git
  track: v*
  ref: v1.53.0-0-ged2ccce0e844a128891cfc334afd371371fae639
