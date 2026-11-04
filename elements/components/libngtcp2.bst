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
  ref: v1.26.0-0-g6a22a4d7a111f6b52391910e40ad3681a09cfb9c
- kind: patch
  path: patches/libngtcp2/0001-lib-CMakeLists.txt-Include-GNUInstallDirs-to-use-CMA.patch
