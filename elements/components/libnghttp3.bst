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
  ref: v1.18.0-0-gdbfc24286138cb0b6490160e7ca87fe1ce6722a0
- kind: git_module
  path: lib/sfparse
  url: github:ngtcp2/sfparse.git
  ref: 4b313cfd2e1b389ae632b36dcd50402307289af2
