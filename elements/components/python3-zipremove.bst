# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:danny0838/zipremove
  track: '*.*.*'
  ref: v0.10.0-0-g7a145aa0bdaad4409db7d7a7d77c25b1eadf8695
