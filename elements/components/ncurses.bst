# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  ncurses: Library functions for terminal-independent applications.

# This element wraps `bootstrap/ncurses.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/ncurses.bst

#runtime-depends:
#- public-stacks/runtime-minimal.bst
