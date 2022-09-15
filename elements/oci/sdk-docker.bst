kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/layers/sdk-init-script.bst
- filename: oci/platform-oci.bst
  config:
    location: /parent
- filename: oci/layers/sdk.bst
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
    mode: docker
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import sdk layer from Freedesktop SDK"
      tags:
      - freedesktopsdk/sdk:latest
    EOF
