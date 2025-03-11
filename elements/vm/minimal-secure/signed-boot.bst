kind: manual

build-depends:
- vm/boot/efi-secure.bst
- filename: vm/minimal-secure/usr-image.bst
  config:
    location: /usr-image
- components/sbsigntools.bst
- components/sign-file.bst
- components/util-linux.bst
- components/binutils.bst

variables:
  strip-binaries: ''
  uuidnamespace: df2427db-01ec-4c99-96b1-be3edb3cd9f6
  (?):
  - target_arch == 'i686':
      efi-arch: ia32
  - target_arch == 'x86_64':
      efi-arch: x64
  - target_arch == 'aarch64':
      efi-arch: aa64
  - target_arch == 'riscv64':
      efi-arch: riscv64

config:
  install-commands:
  - |
    cp -rT /boot "%{install-root}/boot"

  - |
    set -x
    usr_img="$(readlink /usr-image/usr.squashfs)"
    sdk_version="${usr_img##usr_}"
    sdk_version="${sdk_version%.squashfs}"
    sdk_version="${sdk_version%_*}"
    version="$(ls -1 /usr/lib/modules | head -n1)"
    usr_part_uuid="$(uuidgen -s --namespace "%{uuidnamespace}" --name partition-usr)"
    objcopy -O binary -j .cmdline "/boot/EFI/Linux/linux-${version}.efi" cmdline.txt
    echo -n "usrhash=$(cat /usr-image/usr-root-hash.txt) " >new-cmdline.txt
    cat cmdline.txt >>new-cmdline.txt
    objcopy --remove-section .cmdline "/boot/EFI/Linux/linux-${version}.efi" "linux-${version}.efi"
    objcopy --add-section .cmdline=new-cmdline.txt --change-section-vma .cmdline=0x30000 "linux-${version}.efi"
    sbsign --key VENDOR.key --cert VENDOR.crt  --output "%{install-root}/boot/EFI/Linux/freedesktopsdk_${sdk_version}.efi" "linux-${version}.efi"
    rm "%{install-root}/boot/EFI/Linux/linux-${version}.efi"

  - |
    sbsign --key VENDOR.key --cert VENDOR.crt --output "%{install-root}/boot/EFI/systemd/systemd-boot%{efi-arch}.efi" "/boot/EFI/systemd/systemd-boot%{efi-arch}.efi"

  - |
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi" "/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi" "/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi"
    sbsign --key DB.key --cert DB.crt --output "%{install-root}/boot/EFI/BOOT/fb%{efi-arch}.efi" "/boot/EFI/BOOT/fb%{efi-arch}.efi"
    cp "%{install-root}/boot/EFI/freedesktopsdk/mm%{efi-arch}.efi" "%{install-root}/boot/EFI/BOOT/mm%{efi-arch}.efi"
    cp "%{install-root}/boot/EFI/freedesktopsdk/shim%{efi-arch}.efi" "%{install-root}/boot/EFI/BOOT/BOOT$(echo "%{efi-arch}" | tr a-z A-Z).EFI"

sources:
- kind: local
  path: files/boot-keys/VENDOR.key
- kind: local
  path: files/boot-keys/VENDOR.crt
- kind: local
  path: files/boot-keys/DB.key
- kind: local
  path: files/boot-keys/DB.crt
