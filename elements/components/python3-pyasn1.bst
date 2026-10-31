# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:pyasn1/pyasn1.git
  track: v*.*.*
  ref: v0.6.5-0-g5d1673657b729fb580467e2cf4875856bbca5e59
