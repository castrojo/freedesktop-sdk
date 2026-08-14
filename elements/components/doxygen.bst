# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/bison.bst
- components/flex.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_18_0-0-g8e760943e5d9581a444cf327f43a0b4d20d29482
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
