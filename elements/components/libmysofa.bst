# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/cunit.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_TESTS=OFF
    -DBUILD_STATIC_LIBS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libmysofa.so'

sources:
- kind: git_repo
  url: github:hoene/libmysofa.git
  track: "v*"
  ref: v1.3.4-0-g7a0c07111a3d7230ec534e08925c24a7525f33c0
