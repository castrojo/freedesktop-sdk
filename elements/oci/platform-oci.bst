kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/bootstrap-oci.bst
- oci/layers/platform.bst
- oci/layers/platform-init-script.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/platform.bst
    destination: /layer
  - element: oci/bootstrap-oci.bst
    destination: /parent
  - element: oci/layers/platform-init-script.bst
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
      comment: "Import platform layer from Freedesktop SDK"
      index-annotations:
        org.opencontainers.image.ref.name: localhost/freedesktopsdk/platform:latest
    EOF
