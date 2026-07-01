# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/zlib.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:capnproto/capnproto.git
  track: 'v*'
  ref: v1.4.0-0-g8b892a8a11a632f5d52b877a49728808a142379a
