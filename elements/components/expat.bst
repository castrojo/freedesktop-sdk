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
  ref: R_2_11_0-0-gbbdb35e85b68284cb20ad8876c56e9b80175babb
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
