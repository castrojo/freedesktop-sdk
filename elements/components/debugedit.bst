# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  debugedit: Tool for editing debuginfo section in ELF files.

# This element wraps `bootstrap/debugedit.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/debugedit.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
