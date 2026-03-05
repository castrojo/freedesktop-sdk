kind: script

build-depends:
- components/fakecap.bst
- components/systemd-ukify.bst
- vm/boot/efi/deps.bst
- vm/boot/efi/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  install-root: '/boot'

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:

  commands:
  - mkdir -p /fakecap
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /boot
  - |
    prepare-image.sh --sysroot / --rootpasswd root \
                     --seed "%{uuidnamespace}" --noroot >/tmp/vars

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_ESP_PATH=/boot bootctl --no-variables install
  - rm /etc/machine-id
  - |
    cat <<EOF >/boot/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    EOF

  - |
    echo '%{libdir}' >/etc/ld.so.conf

  - |
    . /tmp/vars
    version="$(ls -1 /lib/modules | head -n1)"
    dracut -v --xz --reproducible --fstab \
           --no-machineid --kernel-image "/lib/modules/${version}/vmlinuz" \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "rw console=tty0 console=ttyS0 quiet" \
           --kernel-image "/lib/modules/$(ls -1 /lib/modules | head -n1)/vmlinuz" \
           --install 'fsck.ext4'

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    mkdir -p /boot/EFI/Linux
    ukify build \
      --linux="/lib/modules/${version}/vmlinuz" \
      --initrd="/boot/initramfs-${version}.img" \
      --cmdline="rw console=tty0 console=ttyS0 quiet" \
      --os-release=/etc/os-release \
      --output="/boot/EFI/Linux/freedesktopsdk_${version}.efi"

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    cat <<EOF >/boot/loader/entries/freedesktopsdk-uki.conf
    title Freedesktop SDK (UKI)
    version ${version}
    efi /EFI/Linux/freedesktopsdk_${version}.efi
    EOF
