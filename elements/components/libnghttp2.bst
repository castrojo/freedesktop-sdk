kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/python3-minimal.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: v1.69.0-0-g68cb6900fde14c77f0cd7add0e094a862960eb99
