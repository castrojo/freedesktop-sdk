kind: script

build-depends:
- components/fakecap.bst
- vm/boot/u-boot/deps.bst
- vm/boot/u-boot/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  uuid-boot: 10bf4857-5261-46d4-a178-cca1a9b5b997
  install-root: '/boot'

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:
  commands:
  - mkdir -p /fakecap
  - mkdir -p /boot
  - |
    prepare-image.sh \
       --sysroot / \
       --seed "%{uuidnamespace}" \
       --efipath "/boot" \
       --efisource "UUID=%{uuid-boot}" \
       --efifstype "ext4" \
       --efifsopts "relatime" \
       --rootpasswd "root" >/tmp/vars

  - |
    echo '%{libdir}' >/etc/ld.so.conf

  - |
    . /tmp/vars
    mkdir -p /var/tmp
    dracut -v --xz --reproducible --fstab \
           --no-machineid \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "root=UUID=${uuid_root} rw console=tty0 console=ttyS0 quiet" \
           --install 'fsck.ext4'

  - |
    cp /boot/initramfs-$(ls -1 /lib/modules | head -n1).img /boot/initramfs.img
