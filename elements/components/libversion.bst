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
  ref: 3.0.5-0-g98b0eae101042eb9d7468acc371d52611741deba
