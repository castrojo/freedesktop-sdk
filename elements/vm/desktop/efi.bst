kind: script

build-depends:
- vm/deploy-tools.bst
- vm/desktop/initial-scripts.bst
- vm/prepare-image.bst
- filename: vm/boot/efi-plymouth.bst
  config:
    location: '/sysroot/efi'
- filename: vm/desktop/filesystem.bst
  config:
    location: '/sysroot'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  build-root: /genimage

config:
  commands:
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
            extraargs = "-U ${uuid_root} -E no_copy_xattrs"
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

