# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- components/oci-builder.bst
- oci/layers/bootc-init-script.bst
- oci/layers/bootc-kernel.bst
- filename: oci/layers/bootc.bst
  config:
    location: /layer

- filename: oci/sdk-oci.bst
  config:
    location: /parent
- vm/prepare-image.bst

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap


variables:
  sysroot-seed: 4347ecea-3924-4601-a92b-f7eab2b34445

config:
  commands:
  - mkdir -p /fakecap
  - touch layer/etc/shadow layer/etc/gshadow

  # Run the collected initial scripts against the layer before
  # prepare-image.sh finalizes /etc, matching the other OCI elements.
  - |
    if [ -d /initial_scripts ]; then
      for i in /initial_scripts/*; do
        "${i}" /layer
      done
    fi

  - |
    prepare-image.sh \
       --sysroot /layer \
       --initscripts /initial_scripts \
       --seed "%{sysroot-seed}" \
       --noroot --noboot >/dev/null

  - systemd-sysusers --root /layer


  # Install the kernel and the dracut-generated bootc initramfs into the
  # layer so the resulting container image is bootable. bootc expects the
  # kernel and initramfs to be shipped inside the image under
  # /usr/lib/modules/<kver>/ (/lib is a symlink to /usr/lib).
  - |
    version="$(ls -1 /usr/lib/modules)"
    test -f "/usr/lib/modules/${version}/vmlinuz"
    test -f "/usr/lib/modules/${version}/initramfs.img"
    mkdir -p "/layer/usr/lib/modules/${version}"
    cp "/usr/lib/modules/${version}/vmlinuz" "/layer/usr/lib/modules/${version}/vmlinuz"
    cp "/usr/lib/modules/${version}/initramfs.img" "/layer/usr/lib/modules/${version}/initramfs.img"

  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: oci
    gzip: disabled
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Mark as bootc"
      config:
        Labels:
          'containers.bootc': '1'
      index-annotations:
        org.opencontainers.image.ref.name: localhost/freedesktopsdk/bootc:latest
    EOF
