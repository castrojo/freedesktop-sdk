kind: script

build-depends:
- components/oci-builder.bst
- vm/prepare-image.bst
- oci/layers/bootc-init-script.bst
- filename: oci/sdk-oci.bst
  config:
    location: /parent
- filename: oci/layers/bootc.bst
  config:
    location: /layer

environment:
  LD_PRELOAD: /usr/libexec/fakecap/fakecap.so
  FAKECAP_DB: /fakecap


variables:
  sysroot-seed: 4347ecea-3924-4601-a92b-f7eab2b34445

config:
  commands:
  - mkdir -p /fakecap
  - touch layer/etc/shadow layer/etc/gshadow
  - |
    prepare-image.sh \
       --sysroot /layer \
       --initscripts /initial_scripts \
       --seed "%{sysroot-seed}" \
       --noroot --noboot >/dev/null

  - systemd-sysusers --root /layer

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
