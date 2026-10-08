# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  PCRE2: C library that implements regular expression pattern matching.

# This element wraps `bootstrap/pcre2.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

build-depends:
- bootstrap/pcre2.bst

runtime-depends:
- public-stacks/runtime-minimal.bst
