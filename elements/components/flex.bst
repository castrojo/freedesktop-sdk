# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/flex-base.bst

runtime-depends:
- components/bash.bst
- components/coreutils.bst
- public-stacks/runtime-minimal.bst
- components/symlinks.bst
- components/libfl.bst
- components/m4.bst
- components/utf-locale.bst

config:
  exclude:
  - libfl
