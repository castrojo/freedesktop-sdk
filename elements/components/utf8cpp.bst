# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DUTF8_TESTS=OFF

sources:
- kind: git_repo
  url: github:nemtrif/utfcpp.git
  track: v*
  ref: v4.2.1-0-g3d1ff6dbf54e471c846dff55dda6c8ee10c0ee5c
