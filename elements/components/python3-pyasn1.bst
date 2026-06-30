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
  ref: v0.6.4-0-g72e4803405816c371ed3b2cb4be181c47f038406
