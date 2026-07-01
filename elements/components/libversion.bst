# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:repology/libversion.git
  track: '*.*.*'
  ref: 3.0.4-0-g0c2c247a6c7ed562e6bc85f02cc4709621226c33
