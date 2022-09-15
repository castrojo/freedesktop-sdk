kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/platform-oci.bst
- oci/layers/sdk.bst
- oci/layers/sdk-init-script.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/sdk.bst
    destination: /layer
  - element: oci/platform-oci.bst
    destination: /parent
  - element: oci/layers/sdk-init-script.bst
    destination: /

  commands:
  - |
    if [ -d /initial_scripts ]; then
      for i in /initial_scripts/*; do
        "${i}" /layer
      done
    fi

  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: oci
    gzip: False
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import sdk layer from Freedesktop SDK"
      index-annotations:
        org.opencontainers.image.ref.name: localhost/freedesktopsdk/sdk:latest
    EOF
