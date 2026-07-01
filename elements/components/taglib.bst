# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/utf8cpp.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DBUILD_EXAMPLES=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{bindir}/taglib-config'
        - '%{libdir}/libtag.so'
        - '%{libdir}/libtag_c.so'

sources:
- kind: git_repo
  url: github:taglib/taglib.git
  track: v*
  exclude:
  - "*beta*"
  ref: v2.3-0-g1b94b93762636ebe5733180c3e825be4621e4c7f
