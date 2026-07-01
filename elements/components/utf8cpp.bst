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
  ref: v4.1.1-0-g819011bb01628fe1aa2f1da9f2c842a48fd5680b
