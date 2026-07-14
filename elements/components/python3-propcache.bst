# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: pyproject

build-depends:
- public-stacks/buildsystem-python-setuptools.bst
- components/cython.bst
- components/python3-expandvars.bst

runtime-depends:
- components/python3.bst

environment:
  PROPCACHE_BUILD_INPLACE: 'true'

sources:
- kind: git_repo
  url: github:aio-libs/propcache.git
  track: v*
  ref: v0.5.2-0-g041f7afe0dff07f3baa77ff444dd735433290940
- kind: patch
  path: patches/python3-propcache/allow-cython.patch
