# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- components/iproute2.bst
- vm/base-filesystem.bst
- vm/config/journald.bst
- vm/config/networkd.bst
- vm/config/resolved.bst
- vm/config/useradd-default.bst
- vm/config/systemd-homed-firstboot.bst
- components/usbutils.bst
- components/hosts.bst
- components/bash-config.bst
- components/bash-completion.bst
- vm/boot/efi-secure/signed-modules.bst
- vm/minimal-secure/repart-config.bst
- components/less.bst
- components/audit.bst
- components/nsswitch-config.bst
- vm/minimal-secure/sysupdate-config.bst
- vm/minimal-secure/enable-sysupdate.bst
- components/keyutils.bst

(?):
- ("firmware" in minimal_vm):
    depends:
      (>):
      - components/linux-firmware.bst
