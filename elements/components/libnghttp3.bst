kind: cmake_recc

build-depends:
- components/_private/buildsystem-cmake.bst
- components/_private/recc.bst
- components/openssl.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DENABLE_LIB_ONLY=ON
    -DENABLE_STATIC_LIB=OFF
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnghttp3.so'

sources:
- kind: git_repo
  url: github:ngtcp2/nghttp3.git
  track: v*
  ref: v1.15.0-0-gd326f4c1eb3f6a780d77793b30e16756c498f913
- kind: git_module
  path: lib/sfparse
  url: github:ngtcp2/sfparse.git
  ref: ff7f230e7df2844afef7dc49631cda03a30455f3
