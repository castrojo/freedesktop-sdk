kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/layers/flatpak-init-script.bst
- filename: oci/sdk-oci.bst
  config:
    location: /parent
- filename: oci/layers/flatpak.bst
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
      comment: "Import flatpak"
    EOF
