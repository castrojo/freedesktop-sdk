kind: script

build-depends:
- vm/boot/efi-plymouth/deps.bst
- vm/boot/efi-plymouth/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  # FIXME: dracut uses wront directory when using /efi
  install-root: '/boot'

config:

  commands:
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /boot
  - prepare-image.sh --seed "%{uuidnamespace}" >/tmp/vars

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_RELAX_ESP_CHECKS=1 bootctl --path='/boot' --no-variables install
  - rm /etc/machine-id
  - |
    cat <<EOF >/boot/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    default *
    EOF

  - |
    . /tmp/vars
    dracut -v --fstab --uefi \
           --uefi-stub /usr/lib/systemd/boot/efi/linuxx64.efi.stub \
           --no-machineid --kernel-image /boot/vmlinuz \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "rw quiet splash" \
           --install 'fsck.ext4'

  - |
    rm -f /boot/vmlinuz
