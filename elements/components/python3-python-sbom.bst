# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst

depends:
- components/python3-installer.bst
- components/python3-packageurl.bst
- components/python3-zipremove.bst
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:tox-dev/python-sbom
  track: '*.*.*'
  ref: 0.3.1-0-g800cf535aec00992a891216cf7f1945167d62e89
