# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst


sources:
- kind: git_repo
  url: github:jaraco/backports.entry_points_selectable.git
  track: v*
  ref: v1.3.0-0-g27a788feb0b51d89dd405d2d80cf3e0dac19bbf0
