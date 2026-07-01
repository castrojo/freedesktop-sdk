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
  ref: v1.16.0-0-g2b77da6dc6cd00897ad18540b0d5ce3c4fbf3d2b
- kind: git_module
  path: lib/sfparse
  url: github:ngtcp2/sfparse.git
  ref: ff7f230e7df2844afef7dc49631cda03a30455f3
