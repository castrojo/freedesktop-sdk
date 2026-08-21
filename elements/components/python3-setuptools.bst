# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/python3-setuptools.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/python3.bst

config:
  include-orphans: True
