# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jazzband/pathlib2.git
  track: "*.*.*"
  ref: 2.3.7-post1-0-ge9b1985b141a527061137d28a9f3c7f54e849343
