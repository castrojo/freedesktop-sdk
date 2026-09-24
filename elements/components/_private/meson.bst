# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/runtime-gnu.bst
- components/_private/python3-build.bst
- components/_private/python3-installer.bst
- components/_private/python3-minimal.bst
- components/_private/python3-setuptools.bst
- components/_private/python3-wheel.bst

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
  ref: 1.12.1-0-g70598bb7825f0f804fb31ec2795de5e79e7692a0
