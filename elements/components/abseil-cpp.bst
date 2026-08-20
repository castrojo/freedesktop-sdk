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
    -DCMAKE_SKIP_INSTALL_RPATH=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libabsl_*.so'

sources:
- kind: git_repo
  url: github:abseil/abseil-cpp.git
  track: '[0-9]*.[0-9]'
  ref: 20260817.0-0-g2065f4ded0558c6f89fee67c8e5228feb4eb960e
