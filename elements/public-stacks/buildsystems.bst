# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: compose

build-depends:
- public-stacks/buildsystem-autotools.bst
- public-stacks/buildsystem-cmake.bst
- public-stacks/buildsystem-meson.bst
- components/python3.bst
- components/perl.bst

config:
  exclude:
  # Excluded because debug is huge and we don't typically want to
  # debug our compilers
  - debug
