# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  Prototype bootable image for QEMU with u-boot.

build-depends:
- components/fakecap.bst
- components/linux.bst
- vm/boot/u-boot.bst
- vm/deploy-tools.bst
- filename: vm/minimal/filesystem.bst
  config:
    location: '/sysroot'
- vm/minimal/initial-scripts.bst
- filename: vm/minimal/qemu-firmware.bst
  config:
    location: '/firmware'

- vm/prepare-image.bst

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  uuid-boot: 10bf4857-5261-46d4-a178-cca1a9b5b997

config:

  commands:
  - mkdir -p /fakecap
  - mkdir -p /genimage
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --efipath "/boot" \
       --efisource "UUID=%{uuid-boot}" \
       --efifstype "ext4" \
       --efifsopts "relatime" \
       --rootpasswd "root" >/tmp/vars

  - |
    . /tmp/vars
    mkdir -p /sysroot/boot/extlinux
    cat <<EOF >/sysroot/boot/extlinux/extlinux.conf
    default FreedesktopSDK
    menu title Boot Options.
    prompt 0
    timeout 50

    label FreedesktopSDK
        menu label Freedesktop SDK
        linux /vmlinuz
        initrd /initramfs.img
        append root=UUID=${uuid_root} rw console=tty0 console=ttyS0 quiet
    EOF

  - |
    . /tmp/vars
    cat >/genimage/genimage.cfg <<EOF
    image boot.img {
        ext4  {
            label = "boot"
            extraargs = "-U %{uuid-boot}"
            use-mke2fs = true
        }
        mountpoint = "/boot"
        size = 500M
    }
    image root.img {
        ext4  {
            label = "root"
            extraargs = "-U ${uuid_root}"
            use-mke2fs = true
        }
        size = 1G
    }
    image disk.img {
        hdimage {
            align = 1M
            partition-table-type = "gpt"
        }
        partition boot {
            image = "boot.img"
            partition-type-uuid = "bc13c2ff-59e6-4262-a352-b275fd6f7172"
        }
        partition root {
            image = "root.img"
            partition-type-uuid = "%{linux-root}"
        }
    }
    EOF

  - |
    cd /genimage/
    genimage --rootpath /sysroot

  - |
    install -Dm644 -t "%{install-root}" /genimage/images/disk.img

  - |
    install -Dm644 -t "%{install-root}" /firmware/*
