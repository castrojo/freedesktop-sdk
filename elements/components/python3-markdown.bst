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
  ref: 3.11.3-0-g40eca048f57456d855a491e7f94ba215594f3f57
