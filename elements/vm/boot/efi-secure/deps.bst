# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: stack

depends:
- public-stacks/runtime-minimal.bst
- components/_private/shim.bst
- components/binutils.bst
- components/dbus.bst
- components/dracut.bst
- components/efitools.bst
- components/fakecap.bst
- components/linux-firmware.bst
- components/lvm2.bst
- components/os-release.bst
- components/pkg-config.bst
- components/shadow.bst
- components/systemd.bst
- components/tpm2-tools.bst
- components/tpm2-tss.bst
- components/tzdata.bst
- components/util-linux-full.bst
- components/wireless-regdb-bin.bst
- vm/boot/efi-secure/signed-modules.bst
- vm/minimal-secure/repart-config.bst
