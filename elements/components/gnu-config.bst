# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  GNU config: GNU config.guess and config.sub test suite.

# This element wraps `bootstrap/gnu-config.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/gnu-config.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
