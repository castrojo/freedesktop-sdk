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
  ref: gpgmepp-2.1.0-0-g6a99d7eef09aedd768356792f38aca2cc03659da
