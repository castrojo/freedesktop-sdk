# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/docbook-xsl.bst
- components/libxslt.bst

sources:
- kind: git_repo
  url: github:asciidoc-py/asciidoc-py.git
  track: '*.*.*'
  ref-format: git-describe
  ref: 10.2.1-0-g21e33efe96ba9a51d99d1150691dae750afd6ed1
