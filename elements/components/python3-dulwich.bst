# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-rust.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

sources:
- kind: git_repo
  url: github:jelmer/dulwich.git
  track: dulwich-*.*.*
  ref: dulwich-1.2.20-0-gde652805b35611192a8f771fec393ad74b056136
