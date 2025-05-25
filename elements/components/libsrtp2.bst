kind: meson

build-depends:
- components/doxygen.bst
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst

variables:
  meson-local: >-
    -Dtests=disabled
    -Dpcap-tests=disabled
    -Dcrypto-library=openssl
    -Dcrypto-library-kdf=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsrtp2.so'

sources:
- kind: git_repo
  url: github:cisco/libsrtp.git
  track: v*.*.*
  ref: v2.7.0-0-gee1a77c9f9dc02c42bda9901038c500c5efe4cfa
