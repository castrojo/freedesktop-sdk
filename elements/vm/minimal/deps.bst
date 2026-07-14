# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/bash-completion.bst
- components/bash-config.bst
- components/dbus.bst
- components/dracut.bst
- components/hosts.bst
- components/iproute2.bst
- components/linux.bst
- components/os-release.bst
- components/shadow.bst
- components/systemd.bst
- components/tzdata.bst
- components/usbutils.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/systemd-homed-firstboot.bst
- vm/config/useradd-default.bst

(?):
- ("firmware" in minimal_vm):
    depends:
      (>):
      - components/linux-firmware.bst
