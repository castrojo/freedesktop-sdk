# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3.bst

sources:
- kind: pypi
  name: snowballstemmer
  ref:
    sha256sum: e07bbc54a0d798fe6010a12398422e62a8bfbba95c394fd0956ef58cb4d3e260
    suffix: 43/f8/0a71edf031f03c40db17503cb8ca78a69a171254e568e7db241b0ab57ea1/snowballstemmer-3.1.1.tar.gz
