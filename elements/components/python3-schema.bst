# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

runtime-depends:
- components/python3-contextlib2.bst

sources:
- kind: git_repo
  url: github:keleshev/schema.git
  track: v*
  ref: v0.7.8-0-g7434a6b3c9cd1672f0d491ed45114054750627af
