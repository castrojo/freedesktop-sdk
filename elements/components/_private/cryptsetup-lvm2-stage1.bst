# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: filter

build-depends:
- components/_private/cryptsetup-base.bst

runtime-depends:
- components/_private/lvm2-stage1.bst
- components/cryptsetup-manifest.bst
- components/json-c.bst
- components/pwquality.bst
- components/util-linux-libs.bst
