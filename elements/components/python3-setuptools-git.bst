# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst
- components/python3-setuptools.bst

sources:
- kind: git_repo
  url: github:msabramo/setuptools-git.git
  track: "*.*"
  exclude:
  - "*b*"
  ref: 1.2-0-g695e9878e306993944995d99a7eb75d61f64d00a
