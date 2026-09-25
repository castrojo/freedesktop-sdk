# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:Python-Markdown/markdown.git
  track: refs/tags/*.*.*
  ref: 3.11.0-0-g0ffbf00cf667971d46f43aafba825e8d25098bc5
