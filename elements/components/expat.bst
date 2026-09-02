# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: expat
  cmake-local: >-
    -DEXPAT_BUILD_EXAMPLES=OFF
    -DEXPAT_BUILD_TESTS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

sources:
- kind: git_repo
  url: github:libexpat/libexpat.git
  track: R_*
  ref: R_2_8_4-0-g12cf0b1f25f026a022fe728ad8f7e3d017285b80
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
