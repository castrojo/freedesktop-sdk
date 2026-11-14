# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfmt-c.so'
        - '%{libdir}/libfmt.so'

sources:
- kind: git_repo
  url: github:fmtlib/fmt.git
  track: '*.*.*'
  ref: 12.2.1-0-g208219daff58f2a7438f6931cc2ddc358acf33ef
- kind: patch
  path: patches/fmtlib/0001-Fix-fallback-uint128-bitwise-not-4813.patch
- kind: patch
  path: patches/fmtlib/0002-Turn-libfmt-c-into-a-shared-library-4812.patch
