# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Micro root with systemd as PID 1. The kernel and initramfs stay in
  vm/boot/micro.bst. Do not add components/linux.bst here.

depends:
- public-stacks/runtime-minimal.bst
- bootstrap/bash.bst
- components/os-release.bst
- components/systemd.bst
- vm/base-filesystem.bst
- vm/micro/tzdata.bst
