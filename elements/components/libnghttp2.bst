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
  ref: v1.55.0-0-g989d69be01bf1beaf70f5930e716975bbb84b9b9
