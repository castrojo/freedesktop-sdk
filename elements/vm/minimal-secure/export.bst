# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- public-stacks/runtime-gnu.bst
- components/xz.bst
- filename: vm/minimal-secure/signed-boot.bst
  config:
    location: /signed-boot
- filename: vm/minimal-secure/usr-image.bst
  config:
    location: /usr-image

environment:
  XZFLAGS: '-T%{max-jobs}'

environment-nocache:
- XZFLAGS

config:
  commands:
  - |
    set -x
    for format in squashfs verity; do
      image_name="$(readlink "/usr-image/usr.${format}")"
      cp "/usr-image/${image_name}" "%{install-root}/${image_name}"
      xz ${XZFLAGS} "%{install-root}/${image_name}"
    done

  - |
    set -x
    usr_img="$(readlink /usr-image/usr.squashfs)"
    sdk_version="${usr_img##usr_}"
    sdk_version="${sdk_version%.squashfs}"
    sdk_version="${sdk_version%_*}"
    cp "/signed-boot/boot/EFI/Linux/freedesktopsdk_${sdk_version}.efi" '%{install-root}/'
    xz ${XZFLAGS} "%{install-root}/freedesktopsdk_${sdk_version}.efi"
