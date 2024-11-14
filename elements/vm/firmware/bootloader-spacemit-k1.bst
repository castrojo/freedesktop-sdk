kind: manual

build-depends:
- vm/deploy-tools.bst
- components/opensbi-spacemit-k1.bst
- components/u-boot-spacemit-k1.bst

variables:
  board: k1
  strip-binaries: ''

config:
  configure-commands:
  - mkdir -p "%{build-root}"
  - cp /usr/share/u-boot/"%{board}"/* "%{build-root}"
  - cp /usr/share/opensbi/lp64/generic/firmware/fw_dynamic.itb "%{build-root}"


  - |
    cat > %{build-root}/genimage.cfg <<EOF
    image sd.img {
        hdimage {
            partition-table-type = "gpt"
        }
        partition bootinfo {
            image = "%{build-root}/bootinfo_sd.bin"
            offset = "0K"
            size = "512"
            holes = {"(80;512)"}
            in-partition-table = "false"
        }
        partition fsbl {
            image = "%{build-root}/FSBL.bin"
            offset = "128K"
            size = "256K"
            in-partition-table = "true"
        }
        partition env {
            image = "%{build-root}/u-boot-env-default.bin"
            offset = "384K"
            size = "64K"
            in-partition-table = "true"
        }
        partition opensbi {
            image = "%{build-root}/fw_dynamic.itb"
            offset = "1M"
            size = "1M"
            in-partition-table = "true"
        }
        partition uboot {
            image = "%{build-root}/u-boot.itb"
            offset = "2M"
            size = "2M"
            in-partition-table = "true"
        }
    }

    flash nor-4M-64k {
        pebsize = 65536
        numpebs = 64
    }

    image nor.img {
        flash {
        }
        flashtype = "nor-4M-64k"
        partition bootinfo {
            image = "%{build-root}/bootinfo_spinor.bin"
            offset = "0"
            size = "128K"
        }
        partition fsbl {
            image = "%{build-root}/FSBL.bin"
            offset = "128K"
            size = "256K"
        }
        partition env {
            image = "%{build-root}/u-boot-env-default.bin"
            offset = "384K"
            size = "64K"
        }
        partition opensbi {
            image = "%{build-root}/fw_dynamic.itb"
            offset = "448K"
            size = "192K"
        }
        partition uboot {
            image = "%{build-root}/u-boot.itb"
            offset = "640K"
            size = "2M"
        }
    }
    EOF

  build-commands:
  - |
    cd %{build-root}
    genimage --inputpath "%{build-root}" --outputpath "%{install-root}"
