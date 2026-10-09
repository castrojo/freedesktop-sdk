# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  Coreutils: Basic GNU file, shell and text utilities.

# This element wraps `bootstrap/coreutils.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/coreutils.bst

#runtime-depends:
#- public-stacks/runtime-minimal.bst
