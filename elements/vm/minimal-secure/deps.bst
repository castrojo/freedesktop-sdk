# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/audit.bst
- components/bash-completion.bst
- components/bash-config.bst
- components/dbus.bst
- components/dracut.bst
- components/hosts.bst
- components/iproute2.bst
- components/keyutils.bst
- components/less.bst
- components/nsswitch-config.bst
- components/os-release.bst
- components/shadow.bst
- components/systemd.bst
- components/tzdata.bst
- components/usbutils.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- vm/base-filesystem.bst
- vm/boot/efi-secure/signed-modules.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/systemd-homed-firstboot.bst
- vm/config/useradd-default.bst
- vm/minimal-secure/enable-sysupdate.bst
- vm/minimal-secure/repart-config.bst
- vm/minimal-secure/sysupdate-config.bst

(?):
- ("firmware" in minimal_vm):
    depends:
      (>):
      - components/linux-firmware.bst
