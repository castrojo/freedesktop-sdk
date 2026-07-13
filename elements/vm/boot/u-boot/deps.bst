# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/linux.bst
- components/linux-firmware.bst
- components/wireless-regdb-bin.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- components/pkg-config.bst
