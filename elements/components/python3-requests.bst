# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

runtime-depends:
- components/python3-certifi.bst
- components/python3-chardet.bst
- components/python3-charset-normalizer.bst
- components/python3-idna.bst
- components/python3-urllib3.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:psf/requests.git
  track: v*
  exclude:
  - "*dev*"
  ref: v2.34.2-0-g6e83187b8feb273ed4c6cdab5efd8d54901dfab3
