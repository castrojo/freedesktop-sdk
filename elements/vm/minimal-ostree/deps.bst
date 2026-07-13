# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack
description: |
  Contents of the minimal-ostree system are defined here.

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/ostree.bst
- vm/config/useradd-ostree.bst
- vm/config/systemd-homed-firstboot.bst
- vm/boot/efi-ostree.bst
- components/gnupg.bst
- components/wireless-regdb-bin.bst
- components/iproute2.bst
- components/usbutils.bst
- components/hosts.bst
- components/bash-config.bst
- components/bash-completion.bst

(?):
- ("firmware" in minimal_vm):
    depends:
      (>):
      - components/linux-firmware.bst
