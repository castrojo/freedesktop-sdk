# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter
description: |
  libxcrypt: Modern implementation of the crypt password hashing library.

# This element wraps `bootstrap/libxcrypt.bst` to remove the dependency on other
# bootstrap elements, to avoid bringing in the whole bootstrap set.

# Note that public-stacks/runtime-minimal.bst build-depends on this element
# via gcc-libs.bst -> _private/gcc-base.bst -> _private/python3-minimal.bst
# -> autoconf.bst -> perl.bst.
# So we have to use bootstrap/ elements in build-depends, and we cannot
# use public-stacks/runtime-minimal.bst in runtime-depends.

build-depends:
- bootstrap/libxcrypt.bst

#runtime-depends:
