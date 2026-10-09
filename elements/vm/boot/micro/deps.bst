# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Build dependencies for a virtio-9p initramfs. No firmware. Dracut packs
  only the modules named by vm/boot/micro.bst.

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/xz.bst
- components/dracut.bst
- components/linux.bst
- components/os-release.bst
- components/systemd.bst
- components/util-linux-full.bst
