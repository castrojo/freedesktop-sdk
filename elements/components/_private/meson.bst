# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/_private/python3-setuptools.bst
- components/_private/python3-wheel.bst
- components/_private/python3-minimal.bst

depends:
- components/ninja.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:mesonbuild/meson.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 1.11.1-0-g69b3094f84afcf3758cc74b2f547ca34d8fd1621

