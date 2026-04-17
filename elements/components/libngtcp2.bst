kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gnutls.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DENABLE_STATIC_LIB=OFF
    -DENABLE_LIB_ONLY=ON
    -DENABLE_GNUTLS=ON
    -DENABLE_OPENSSL=ON
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libngtcp2.so'
        - '%{libdir}/libngtcp2_crypto_gnutls.so'
        - '%{libdir}/libngtcp2_crypto_ossl.so'

sources:
- kind: git_repo
  url: github:ngtcp2/ngtcp2.git
  track: v*
  ref: v1.22.1-0-g716e64b05f4a3709dfc0b0522cf9fd4456d055e5
