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
  ref: 12.3.0-0-gbb1d8e8ab8d29048624d96e3ee53cecf7c13d13d
- kind: patch
  path: patches/python3-pil/drop-pybind.patch
