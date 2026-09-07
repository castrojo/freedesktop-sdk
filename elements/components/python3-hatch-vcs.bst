# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/python3-hatch-vcs.bst

runtime-depends:
- components/python3-hatchling.bst
- components/python3-setuptools-scm.bst
- components/python3.bst

config:
  include-orphans: True
