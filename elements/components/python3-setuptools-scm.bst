# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/python3-setuptools-scm.bst

runtime-depends:
- components/git.bst
- components/python3-packaging.bst
- components/python3-setuptools.bst
- components/python3-vcs-versioning.bst
- components/python3.bst

config:
  include-orphans: True
