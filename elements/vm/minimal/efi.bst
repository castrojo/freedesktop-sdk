kind: script

build-depends:
- vm/deploy-tools.bst
- vm/minimal/initial-scripts.bst
- vm/prepare-image.bst
- filename: vm/minimal/usr-image.bst
  config:
    location: '/usr-image'
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
    efi_part_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name partition-efi)"
    root_part_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name partition-root)"
    disk_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name disk)"
    hash_seed="$(uuidgen -s --namespace "%{uuidnamespace}" --name hash-seed)"
    . /usr-image/vars.txt
    cat > "%{build-root}/genimage.cfg" <<EOF
    image efi.img {
        vfat {
            extraargs = "--invariant -F32 -i${id_efi} -n EFI"
        }
        mountpoint = "/efi"
        size = 105%
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
            image = "/usr-image/usr.squashfs"
            partition-type-uuid = "%{linux-root}"
            partition-uuid = "${root_part_uuid}"
        }
    }
    config {
      tmppath = "%{build-root}/tmp"
      outputpath = "%{install-root}"
    }
    EOF

  - du -h --max-depth=3 /sysroot | grep '^[^0]' | sort -rh
  - genimage --config "%{build-root}/genimage.cfg" --rootpath /sysroot
  - du -BM "%{install-root}/disk.img"
