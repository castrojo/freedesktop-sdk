# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:erikrose/blessings.git
  track: '*.*'
  ref: 1.7-0-ga6be73029a1329ac927628cdca17e109c4bd902f
