# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/python3-build.bst

runtime-depends:
- components/python3-packaging.bst
- components/python3-pyproject-hooks.bst
- components/python3.bst

config:
  include-orphans: True
