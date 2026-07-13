# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  ref: v1.24.0-0-g956e7b4cfb6762312434ecdddb796baf0775f12a
