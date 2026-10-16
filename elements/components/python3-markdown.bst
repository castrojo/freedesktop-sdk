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
  ref: 3.11.1-0-g2258b48e551d0df7b149ea9c33969bea7c7a0a2b
