# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/jpeg.bst
- components/python3-setuptools.bst

sources:
- kind: git_repo
  url: github:python-pillow/Pillow.git
  track: "*.*.*"
  ref: 13.0.0-0-g293218ad059d994baf1777d882911bed6a49704a
- kind: patch
  path: patches/python3-pil/drop-pybind.patch
