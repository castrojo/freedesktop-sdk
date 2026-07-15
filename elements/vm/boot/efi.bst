# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/binutils.bst
- components/fakecap.bst
- vm/boot/efi/deps.bst
- vm/boot/efi/initial-scripts.bst
- vm/prepare-image.bst

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  # FIXME: dracut uses wrong directory when using /efi
  install-root: '/boot'

  efi-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      efi-arch: x64
  - target_arch == "i686":
      efi-arch: ia32

config:

  commands:
  - mkdir -p /fakecap
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /boot
  - prepare-image.sh --sysroot / --rootpasswd root --seed "%{uuidnamespace}" >/tmp/vars

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_ESP_PATH=/boot bootctl --no-variables install
  - rm /etc/machine-id
  - |
    cat <<EOF >/boot/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    EOF

  - |
    echo '%{libdir}' >/etc/ld.so.conf

  - |
    . /tmp/vars
    version="$(ls -1 /lib/modules | head -n1)"
    dracut -v --xz --reproducible --fstab \
           --no-machineid \
           --uefi "%{install-root}/EFI/Linux/freedesktopsdk.efi" \
           --kernel-image "/lib/modules/${version}/vmlinuz" \
           --kver ${version} \
           --kernel-cmdline "rw console=tty0 console=ttyS0 quiet root=UUID=${uuid_root}" \
           --install 'fsck.ext4'
