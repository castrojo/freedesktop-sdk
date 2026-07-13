# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhwy.so'
        - '%{libdir}/libhwy_contrib.so'
        - '%{libdir}/libhwy_test.so'

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:google/highway.git
  track: '*.*.*'
  ref: 1.4.0-0-g2607d3b5b0113992fe84d3848859eae13b3b52c1
