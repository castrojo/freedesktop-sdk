# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  zlib-ng: High-speed drop-in replacement for zlib.

# This element wraps `bootstrap/zlib-ng.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/zlib-ng.bst

#runtime-depends:
#- public-stacks/runtime-minimal.bst
