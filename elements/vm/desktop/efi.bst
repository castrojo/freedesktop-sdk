# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/fakecap.bst
- filename: vm/boot/efi-plymouth.bst
  config:
    location: '/sysroot/efi'
- vm/deploy-tools.bst
- filename: vm/desktop/filesystem.bst
  config:
    location: '/sysroot'

- vm/desktop/initial-scripts.bst
- vm/prepare-image.bst

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  build-root: /genimage

config:
  commands:
  - mkdir -p /fakecap
  - mkdir -p %{build-root}
  - prepare-image.sh --rootpasswd root --sysroot /sysroot --seed "%{uuidnamespace}" > "%{build-root}/vars"

  - |
    . "%{build-root}/vars"
    cat > "%{build-root}/genimage.cfg" <<EOF
    image efi.img {
        vfat {
            extraargs = "-F32 -i${id_efi} -n EFI"
        }
        mountpoint = "/efi"
        size = 500M
        temporary = true
    }
    image root.img {
        ext4  {
            label = "root"
            extraargs = "-U ${uuid_root}"
            use-mke2fs = true
        }
        size = 5G
        temporary = true
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
    config {
      tmppath = "%{build-root}/tmp"
      outputpath = "%{install-root}"
    }
    EOF

  - genimage --config "%{build-root}/genimage.cfg" --rootpath /sysroot
