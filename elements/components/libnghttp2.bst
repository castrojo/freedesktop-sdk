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
- kind: git_tag
  url: github:nghttp2/nghttp2.git
  track: master
  ref: v1.51.0-0-g00399695cb3ea9715162b6a15c0d7b185ac384d2
