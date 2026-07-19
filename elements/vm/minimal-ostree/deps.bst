# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Contents of the minimal-ostree system are defined here.

depends:
- public-stacks/runtime-gnu.bst
- components/bash-completion.bst
- components/bash-config.bst
- components/dbus.bst
- components/dracut.bst
- components/gnupg.bst
- components/hosts.bst
- components/iproute2.bst
- components/os-release.bst
- components/shadow.bst
- components/systemd.bst
- components/tzdata.bst
- components/usbutils.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- vm/boot/efi-ostree.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/ostree.bst
- vm/config/resolved.bst
- vm/config/systemd-homed-firstboot.bst
- vm/config/useradd-ostree.bst

(?):
- ("firmware" in minimal_vm):
    depends:
      (>):
      - components/linux-firmware.bst
