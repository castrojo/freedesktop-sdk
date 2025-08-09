kind: script
description: |
  Construct a disk image for the minimal-ostree system.

  This element produces a `disk.img` file, suitable for booting in a
  virtual machine that supports UEFI.

  The boot partition contains files deployed by `ostree admin deploy`.

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
  - mkdir -p "${OSTREE_REPO}"
  - ostree init --repo="${OSTREE_REPO}" --mode=bare

  - ostree config --group sysroot set bootloader none
  - ostree pull-local /source-repo/ostree/repo %{ostree-branch}

  - mkdir -p "%{sysroot}/boot"

  - ostree admin init-fs "%{sysroot}"
  - ostree admin os-init --sysroot="%{sysroot}" freedesktop-sdk
  - |
    ostree admin deploy --os="freedesktop-sdk" \
         --sysroot="%{sysroot}" %{ostree-branch} \
         --karg="rw" --karg=console=ttyS0

  - |
    mkdir -p "%{sysroot}/etc/ostree"
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/etc/ostree/remotes.d "%{sysroot}/etc/ostree/remotes.d"

  - |
    ostree admin set-origin --sysroot="%{sysroot}" \
           --index=0 \
           FreedesktopSDK dummy \
           %{ostree-branch}

  - |
    cp -r "%{sysroot}"/ostree/boot.1/freedesktop-sdk/*/*/boot/EFI/ "%{sysroot}/boot/"
    rm "%{sysroot}/boot/boot"

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

  - |
    install -Dm644 -t "%{install-root}" genimage/images/disk.img
    du -BM "%{install-root}/disk.img"
