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
  ref: R_2_10_0-0-ga70841d9ffa64ddde29ab824ed6305035ebe4c47
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
