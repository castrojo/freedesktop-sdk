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
  ref: v0.22.2-0-g6a2e12fdc30b521d11f781f986390525a54398bf
