# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-setuptools.bst
- components/jpeg.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 12.2.0-0-g3c41c095064200a02672d89cc5ff629eaf4b0d4f
- kind: patch
  path: patches/python3-pil/drop-pybind.patch
