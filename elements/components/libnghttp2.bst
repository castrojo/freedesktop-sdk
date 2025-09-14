kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v1.67.0-0-g45ac57609bc21cef2463f46258d28a4dc0623333
