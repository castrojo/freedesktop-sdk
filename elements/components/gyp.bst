# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/ninja.bst
- components/python3-packaging.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:nodejs/gyp-next.git
  track: v*
  ref: v0.22.3-0-gf644b2d18ac49b30476ccbfb0d4f825a4f252b81
