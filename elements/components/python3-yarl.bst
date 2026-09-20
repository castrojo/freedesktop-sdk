# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/python3-expandvars.bst

runtime-depends:
- components/python3-idna.bst
- components/python3-multidict.bst
- components/python3-propcache.bst
- components/python3.bst

environment:
  YARL_NO_EXTENSIONS: '1'

sources:
- kind: git_repo
  url: github:aio-libs/yarl.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.25.1-0-g604eb6da83267f4e8faf1512ffeabc23df10052e
