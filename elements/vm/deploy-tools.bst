# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: Deployment tooling

depends:
- components/e2fsprogs.bst
- components/systemd.bst
- components/dosfstools.bst
- components/mtools.bst
- components/tzdata.bst
- vm/prepare-image.bst
- components/genimage.bst
- integration/mtab.bst
