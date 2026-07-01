# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-poetry.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:aio-libs/aiohappyeyeballs.git
  track: v*
  ref: v2.7.0-0-g6ab260ba9fc9bb961f57b26df383a580d5358657
