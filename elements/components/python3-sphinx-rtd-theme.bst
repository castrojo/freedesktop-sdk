# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst

depends:
- components/python3-sphinxcontrib-jquery.bst

sources:
- kind: git_repo
  url: github:readthedocs/sphinx_rtd_theme.git
  track: '*.*.*'
  exclude:
  - '*rc*'
  ref: 3.1.0-0-g795de79c8b311592f5863a25307d85924bf52164
