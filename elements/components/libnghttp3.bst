# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/openssl.bst

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
  ref: v1.19.0-0-gdc83309ca5fd2beb91cc5c030a2d30525e9f2a00
- kind: git_module
  path: lib/sfparse
  url: github:ngtcp2/sfparse.git
  ref: 4b313cfd2e1b389ae632b36dcd50402307289af2
- kind: patch
  path: patches/libnghttp3/0001-lib-CMakeLists.txt-Include-GNUInstallDirs-to-use-CMA.patch
