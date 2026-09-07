# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/git-minimal.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
- bootstrap/zlib-ng.bst

config:
  include-orphans: True
