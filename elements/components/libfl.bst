# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/flex-base.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/utf-locale.bst

config:
  include:
  - libfl
