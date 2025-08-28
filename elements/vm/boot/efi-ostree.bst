kind: script
description: |
  UEFI bootloader and initramfs for the minimal-ostree system.

  There are two components built by this element:

    * the bootloader, installed to `/boot/EFI/`
    * the initramfs, installed to `/usr/lib/modules`

  These files become part of the filesystem tree committed in
  `vm/minimal-ostree/repo.bst`.

  When building a bootable disk image, the EFI bootloader in `/boot/EFI`
  becomes part of the EFI System Partition (ESP) in the final disk image,
  and is the entry point from the target machine's firmware. See
  `vm/minimal-ostree/image.bst` for more details.

  When OSTree deploys a tree as an update to an existing, it only updates the
  bootloader configuration in the ESP. (This is at `/loader` following the UAPI
  Boot Loader Specification[1]). OSTree itself doesn't support updating the
  bootloader application in an existing system's ESP.

build-depends:
- components/fakecap.bst
- vm/boot/efi-ostree/deps.bst
- vm/boot/efi-ostree/initial-scripts.bst
- vm/prepare-image.bst

variables:
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6

  efi-arch: "%{arch}"
  (?):
  - target_arch == "x86_64":
      efi-arch: x64
  - target_arch == "i686":
      efi-arch: ia32

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap

config:

  commands:
  - mkdir -p /fakecap
  - mkdir -p /tmp
  - mkdir -p /var/tmp
  - mkdir -p /efi

  # Calculate filesystem UUIDs, write them to `/etc/fstab` and `/tmp/vars`.
  #
  # Note: this modifies various files in /etc/ in the sandbox, which is not
  # best practice as it could have unintended side effects.
  - |
    prepare-image.sh --rootpasswd root --seed "%{uuidnamespace}" \
         --efipath /boot --efisource LABEL=EFI >/tmp/vars

  # Build the initramfs using dracut. This reads the root filesystem UUID
  # from `/etc/fstab`.
  - |
    mkdir -p "%{install-root}/usr/lib/"
    cp -r /usr/lib/modules "%{install-root}/usr/lib/"

  - |
    echo '%{libdir}' >/etc/ld.so.conf

  - |
    . /tmp/vars
    version="$(ls -1 /lib/modules | head -n1)"
    mkdir -p "%{install-root}/usr/lib/modules/${version}"
    dracut -v --xz --reproducible --fstab \
           --no-machineid \
           --kver "${version}" \
           --add ostree \
           --install 'fsck.ext4' \
           "%{install-root}/usr/lib/modules/${version}/initramfs"

  - |
    version="$(ls -1 /lib/modules | head -n1)"
    cp /boot/vmlinuz "%{install-root}/usr/lib/modules/${version}/vmlinuz"

  # Install the bootloader.
  #
  # This installs a copy of systemd-boot to the UEFI standard's "default
  # bootloader" path within the ESP at, `EFI/BOOT/BOOTX64.efi`.
  - dbus-uuidgen >/etc/machine-id
  - SYSTEMD_ESP_PATH=/efi bootctl --no-variables install
  - rm /etc/machine-id

  - |
    cp -r /efi "%{install-root}/boot"

  # Configure systemd-boot to briefly show its boot menu on startup.
  - |
    cat <<EOF >%{install-root}/boot/loader/loader.conf
    timeout 3
    editor yes
    console-mode keep
    EOF
