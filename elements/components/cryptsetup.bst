# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/cryptsetup-base.bst

runtime-depends:
- components/cryptsetup-manifest.bst
- components/json-c.bst
- components/pwquality.bst
- components/libdevmapper.bst
- components/popt.bst
- components/util-linux-libs.bst
