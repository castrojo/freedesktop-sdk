kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/layers/sdk-init-script.bst
- filename: oci/sdk-oci.bst
  config:
    location: /parent
- filename: oci/layers/debug.bst
  config:
    location: /layer

config:
  commands:
  - |
    if [ -d /initial_scripts ]; then
      for i in  /initial_scripts/*; do
        "${i}" /layer
      done
    fi

  - |
    cd "%{install-root}"
    build-oci <<EOF
    mode: docker
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import debug layer from Freedesktop SDK"
      tags:
      - freedesktopsdk/debug:latest
    EOF
