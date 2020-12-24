kind: stack

depends:
- bootstrap-import.bst
- components/util-linux.bst
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
- vm/boot/efi-ostree.bst
- components/gnupg.bst
- components/eos-updater.bst
- components/linux-firmware.bst
- components/wireless-regdb-bin.bst
- components/iproute2.bst
- components/usbutils.bst
- components/hosts.bst
- components/bash-config.bst
- components/bash-completion.bst
