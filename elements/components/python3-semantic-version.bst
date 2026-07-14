# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:rbarrois/python-semanticversion.git
  track: "*.*.*"
  ref: 2.10.0-0-ge49b5b065b845cd7798c0219e0fa8986c75f6a4a
