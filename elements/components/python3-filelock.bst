# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-hatchling.bst
- components/python3-hatch-fancy-pypi-readme.bst
- components/python3-python-sbom.bst

depends:
- components/python3.bst

variables:
  strip-binaries: ''

sources:
- kind: git_repo
  url: github:tox-dev/filelock.git
  track: "*.*.*"
  ref: 4.3.0-0-g54e61ea35b50a067274d6a04300dad86b341cc5a
