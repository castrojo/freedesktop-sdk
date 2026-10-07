# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  Virtio-only initramfs for the micro image. Desktop keeps vm/boot/virt.bst.

build-depends:
- components/fakecap.bst
- vm/boot/micro/deps.bst
- vm/prepare-image.bst

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: /boot

config:
  commands:
  - mkdir -p /fakecap
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /boot
  - |
    prepare-image.sh --rootpasswd root --seed "%{uuidnamespace}" \
                     --noboot \
                     --rootfstype 9p \
                     --rootsource virtfs \
                     >/tmp/vars
  - echo '%{libdir}' >/etc/ld.so.conf
  - |
    version="$(ls -1 /lib/modules | head -n1)"
    dracut -v --reproducible --fstab \
           --no-machineid \
           --no-hostonly \
           --kernel-image "/lib/modules/${version}/vmlinuz" \
           --kver ${version} \
           --add "virtfs" \
           --add-drivers "9p 9pnet 9pnet_virtio virtio_pci" \
           --omit "multipath lvm mdraid crypt dmraid iscsi nfs network plymouth qemu" \
           --gzip \
           /boot/initramfs.gz
  - |
    version="$(ls -1 /lib/modules | head -n1)"
    cp /lib/modules/${version}/vmlinuz /boot/vmlinuz
