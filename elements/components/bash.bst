# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  Bash: The GNU Bourne Again shell.

# This element wraps `bootstrap/bash.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/bash.bst

#runtime-depends:
#- public-stacks/runtime-minimal.bst
