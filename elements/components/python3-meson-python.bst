# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-meson.bst
- components/python3-build.bst
- components/python3-installer.bst
- components/python3-packaging.bst

depends:
- components/meson.bst
- components/ninja.bst
- components/patchelf.bst
- components/python3-pyproject-metadata.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:mesonbuild/meson-python.git
  track: '*.*.*'
  ref: 0.22.1-0-g4771b36414f38a772fcf7364ef7f191f1dd5588b
