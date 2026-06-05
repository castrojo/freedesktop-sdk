kind: stack

depends:
- public-stacks/runtime-gnu.bst
- components/util-linux-full.bst
- components/linux-firmware.bst
- components/wireless-regdb-bin.bst
- components/systemd.bst
- components/dbus.bst
- components/dracut.bst
- components/os-release.bst
- components/shadow.bst
- components/tzdata.bst
- components/pkg-config.bst
- vm/boot/efi-secure/signed-modules.bst
- components/_private/shim.bst
- vm/minimal-secure/repart-config.bst
- components/tpm2-tss.bst
- components/tpm2-tools.bst
- components/efitools.bst
- components/binutils.bst
- components/fakecap.bst
- components/lvm2.bst
