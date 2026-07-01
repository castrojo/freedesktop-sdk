# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: gitlab:ericvsmith/toposort.git
  track: '*.*'
  ref: 1.10-0-ge67c242ceec5908564837ce6ac2cb661659b0cc8
