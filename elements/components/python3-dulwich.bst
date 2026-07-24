# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-rust.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-urllib3.bst

sources:
- kind: git_repo
  url: github:jelmer/dulwich.git
  track: dulwich-*.*.*
  ref: dulwich-1.2.12-0-gc9240bc94dcdec265b5df2b5d304260d9dad6f1b
