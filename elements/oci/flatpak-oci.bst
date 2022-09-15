kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/sdk-oci.bst
- oci/layers/flatpak.bst
- oci/layers/flatpak-init-script.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/flatpak.bst
    destination: /layer
  - element: oci/sdk-oci.bst
    destination: /parent
  - element: oci/layers/flatpak-init-script.bst
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
      comment: "Import flatpak"
    EOF
