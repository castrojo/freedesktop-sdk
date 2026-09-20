# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/runtime-gnu.bst
- components/python3-build.bst
- components/python3-installer.bst

depends:
- components/python3-editables.bst
- components/python3-packaging.bst
- components/python3-pathspec.bst
- components/python3-pluggy.bst
- components/python3-tomlkit.bst
- components/python3-trove-classifiers.bst
- components/python3.bst

variables:
  command-subdir: backend
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/hatch.git
  track: hatchling-*
  ref: hatchling-v1.32.3-0-g0941887cd24b8585c30761d0396d9357e9d9effe
