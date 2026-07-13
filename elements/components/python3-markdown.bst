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
  ref: 3.10.2-0-ge7a0efb3a7c36d6b8005403122705662bc17c904
