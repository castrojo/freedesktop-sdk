# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

description: "Build backend for CMake based projects"

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-vcs.bst

runtime-depends:
- components/python3-packaging.bst
- components/python3-pathspec.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:scikit-build/scikit-build-core
  track: v*
  ref: v1.1.2-0-g695aa70a0db77f2c36e80c2bffcf3b4bd74df37b
  provenance:
    homepage: https://scikit-build-core.readthedocs.io/en/latest/
    issue-tracker: https://github.com/scikit-build/scikit-build-core/issues
