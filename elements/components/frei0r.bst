# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst

variables:
  cmake-local: >-
    -DWITHOUT_OPENCV=ON
    -DWITHOUT_GAVL=ON

sources:
- kind: git_repo
  url: github:dyne/frei0r.git
  track: v*
  ref: v3.3.2-0-gf4e8ff8e05a4fb81e7e6bcce94784dc2e49f9b00
