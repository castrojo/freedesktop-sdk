# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/meson.bst

runtime-depends:
- components/ninja.bst
- components/python3.bst

config:
  include-orphans: True
