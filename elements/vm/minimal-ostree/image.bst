# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script
description: |
  Construct a bootable disk image from the minimal-ostree system's OSTree repo.

  This element produces a `disk.img` file, suitable for booting in a
  virtual machine that supports UEFI.

  The boot partition or ESP contains:

    * The bootloader, constructed in `vm/boot/efi-ostree.bst`.
    * Bootloader configuration files created by `ostree admin deploy`.

  The root partition holds the OSTree repo, and an initial deployment of the
  filesystem created by `ostree admin deploy`.

  The OSTree repo in the root partition is preconfigured to pull updates from
  the `ostree-remote-url` defined in `ostree-config.yml`. This enables the
  local development workflow documented in `BOOTABLE_IMAGES.md`.

build-depends:
- components/fakecap.bst
- components/ostree.bst
- vm/deploy-tools.bst
- filename: vm/minimal-ostree/repo.bst
  config:
    location: '/source-repo'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

  (@):
  - ostree-config.yml

  sysroot: "%{build-root}/sysroot"

environment:
  OSTREE_REPO: "%{sysroot}/ostree/repo"
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:
  commands:
  - mkdir -p /fakecap

  # Create a new OSTree repo in the sysroot and pull the minimal-ostree tree.
  - mkdir -p "${OSTREE_REPO}"
  - ostree init --repo="${OSTREE_REPO}" --mode=bare
  - ostree pull-local /source-repo/ostree/repo %{ostree-branch}

  # Disable legacy bootloader compatibility in OSTree. In this mode, it deploys
  # UAPI-compatible bootloader config to `/boot/loader/`.
  - ostree config --group sysroot set bootloader none
  - mkdir -p "%{sysroot}/boot"

  # Prepare the root filesystem and deploy the minimal-ostree tree.
  - ostree admin init-fs "%{sysroot}"
  - ostree admin os-init --sysroot="%{sysroot}" freedesktop-sdk
  - |
    ostree admin deploy --os="freedesktop-sdk" \
         --sysroot="%{sysroot}" %{ostree-branch} \
         --karg="rw" --karg=console=ttyS0

  # Add the remote and configure OSTree to pull updates from it.
  - |
    mkdir -p "%{sysroot}/etc/ostree"
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/etc/ostree/remotes.d "%{sysroot}/etc/ostree/remotes.d"

  - |
    ostree admin set-origin --sysroot="%{sysroot}" \
           --index=0 \
           FreedesktopSDK dummy \
           %{ostree-branch}

  # Install the UEFI bootloader that we prepared in `vm/boot/efi-ostree.bst`.
  - |
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/boot/EFI/ "%{sysroot}/boot/"
    rm "%{sysroot}/boot/boot"

  # Generate the final disk image.
  #
  # This is the simplest UEFI-compliant image layout, with just an EFI System
  # Partition and a root partition. The files in the sysroot at `/boot` move
  # into the ESP and everything else stays in the root partition.
  - |
    mkdir -p genimage

  - |
    cat >genimage/genimage.cfg <<EOF
    image efi.img {
        vfat {
            extraargs = "-F32 -n EFI"
        }
        mountpoint = "/boot"
        size = 105%
    }
    image root.img {
        ext4  {
            label = "root"
            use-mke2fs = true
        }
        size = 120%
    }
    image disk.img {
        hdimage {
            align = 1M
            partition-table-type = "gpt"
        }
        partition efi {
            image = "efi.img"
            partition-type-uuid = "U"
        }
        partition root {
            image = "root.img"
            partition-type-uuid = "%{linux-root}"
        }
    }
    EOF

  - |
    cd genimage
    genimage --rootpath "%{sysroot}"

  # Copy the disk image into the output directory.
  - |
    install -Dm644 -t "%{install-root}" genimage/images/disk.img
    du -BM "%{install-root}/disk.img"
