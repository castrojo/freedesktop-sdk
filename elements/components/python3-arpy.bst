# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:viraptor/arpy.git
  track: '*.*.*'
  ref: 2.3.0-0-g68233a171c01e2242225baf084dac5c14562ef8d
