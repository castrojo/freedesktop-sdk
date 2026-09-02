# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gpgme.bst
- components/libassuan.bst
- components/libgpg-error.bst

variables:
  cmake-local: >-
    -DENABLE_SHARED=ON
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgpgmepp.so'

sources:
- kind: git_repo
  url: github:gpg/gpgmepp.git
  track: gpgmepp-*
  exclude:
  - "*-base"
  ref: gpgmepp-2.2.0-0-g1b3da8425856c558fe31d6d85aa99e1f9ec5bc9f
