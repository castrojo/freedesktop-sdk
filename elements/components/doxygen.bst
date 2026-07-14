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
  ref: Release_1_17_0-0-g65a43c0aba45cc23b3ca11b6b5334d4eea931726
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
