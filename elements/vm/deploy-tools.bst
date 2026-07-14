# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: Deployment tooling

depends:
- components/dosfstools.bst
- components/e2fsprogs.bst
- components/genimage.bst
- components/mtools.bst
- components/systemd.bst
- components/tzdata.bst
- integration/mtab.bst
- vm/prepare-image.bst
