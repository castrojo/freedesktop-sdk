kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/layers/platform-init-script.bst
- filename: oci/bootstrap-oci.bst
  config:
    location: /parent
- filename: oci/layers/platform.bst
  config:
    location: /layer

config:
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
