kind: script

build-depends:
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

config:
  commands:
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

  - |
    mkdir -p genimage

  - |
    cat >genimage/genimage.cfg <<EOF
    image efi.img {
        vfat {
            extraargs = "-F32 -n EFI"
        }
        mountpoint = "/boot"
        size = 500M
    }
    image root.img {
        ext4  {
            label = "root"
            extraargs = "-E no_copy_xattrs"
            use-mke2fs = true
        }
        size = 2G
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
