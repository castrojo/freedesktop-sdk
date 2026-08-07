# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-setuptools-scm.bst

depends:
- components/python3.bst

sources:
- kind: git_repo
  url: github:jd/tenacity.git
  track: '*.*.*'
  ref: 9.2.0-0-ga2af454834c6bb5a1e39d67334031cdaf0f475b5
