# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/_private/python3-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:pypa/setuptools.git
  track: v*
  ref: v83.0.0-0-g6519f728c6f23c992df81a5691ef7655184a20eb
