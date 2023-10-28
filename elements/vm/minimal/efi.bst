kind: script

build-depends:
- vm/deploy-tools.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst
- filename: vm/minimal/filesystem.bst
  config:
    location: '/sysroot'
- filename: vm/boot/efi.bst
  config:
    location: '/sysroot/efi'

environment:
  E2FSPROGS_FAKE_TIME: '%{source-date-epoch}'

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  build-root: /genimage

config:
  commands:
  - mkdir -p %{build-root}
  - |
    prepare-image.sh \
       --sysroot /sysroot \
       --seed "%{uuidnamespace}" \
       --rootpasswd "root" > "%{build-root}/vars"

  - |
    efi_part_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name partition-efi)"
    root_part_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name partition-root)"
    disk_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name disk)"
    hash_seed="$(uuidgen -s --namespace "%{uuidnamespace}" --name hash-seed)"
    . "%{build-root}/vars"
    cat > "%{build-root}/genimage.cfg" <<EOF
    image efi.img {
        vfat {
            extraargs = "--invariant -F32 -i${id_efi} -n EFI"
        }
        mountpoint = "/efi"
        size = 125M
        temporary = true
    }
    image root.img {
        ext4  {
            label = "root"
            extraargs = "-U ${uuid_root} -E hash_seed=${hash_seed},no_copy_xattrs"
            use-mke2fs = true
            fs-timestamp = "${SOURCE_DATE_EPOCH}"
        }
        size = 2G
        temporary = true
    }
    image disk.img {
        hdimage {
            align = 1M
            partition-table-type = "gpt"
            disk-uuid = "${disk_uuid}"
        }
        partition efi {
            image = "efi.img"
            partition-type-uuid = "U"
            partition-uuid = "${efi_part_uuid}"
        }
        partition root {
            image = "root.img"
            partition-type-uuid = "%{linux-root}"
            partition-uuid = "${root_part_uuid}"
        }
    }
    config {
      tmppath = "%{build-root}/tmp"
      outputpath = "%{install-root}"
    }
    EOF

  - genimage --config "%{build-root}/genimage.cfg" --rootpath /sysroot
