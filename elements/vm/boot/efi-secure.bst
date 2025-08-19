kind: script

build-depends:
- vm/boot/efi-secure/deps.bst
- vm/boot/efi-secure/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

  efi-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      efi-arch: x64
  - target_arch == "i686":
      efi-arch: ia32

config:
  commands:
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /boot

  - |
    prepare-image.sh --sysroot / --rootpasswd root \
                     --seed "%{uuidnamespace}" >/tmp/vars

  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_ESP_PATH=/boot bootctl --no-variables install
  - rm /etc/machine-id

  - |
    echo '%{libdir}' >/etc/ld.so.conf

  - |
    dracut -v --xz --reproducible --fstab \
           --uefi \
           --no-machineid --kernel-image /boot/vmlinuz \
           --kver $(ls -1 /lib/modules | head -n1) \
           --kernel-cmdline "rw mount.usrflags=ro console=ttyS0 lockdown=confidentiality" \
           --install 'fsck.ext4' \
           --install 'mkfs.ext4' \
           --libdirs %{libdir} \
           --libdirs %{indep-libdir} \
           --add systemd-repart \
           --add systemd-veritysetup \
           --add crypt \
           --add tpm2-tss

  - mkdir -p '%{install-root}/boot/loader/keys/auto'

  - cp -r '%{datadir}/efitools/efi'/{PK,KEK,DB}.auth '%{install-root}/boot/loader/keys/auto'

  - |
    cat <<EOF >"%{install-root}/boot/loader/loader.conf"
    timeout 3
    editor yes
    console-mode keep
    secure-boot-enroll force
    EOF

  - mkdir -p "%{install-root}/usr/lib/modules"
  - cp -rT /usr/lib/modules "%{install-root}/usr/lib/modules"

  - mkdir -p "%{install-root}/boot/EFI"
  - cp -rT /boot/EFI "%{install-root}/boot/EFI"
  - mkdir -p "%{install-root}/boot/loader"
