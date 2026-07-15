# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/dbus.bst
- components/dracut.bst
- components/linux-firmware.bst
- components/linux.bst
- components/os-release.bst
- components/ostree.bst
- components/pkg-config.bst
- components/shadow.bst
- components/systemd.bst
- components/tzdata.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
