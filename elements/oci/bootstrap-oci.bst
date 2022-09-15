kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/layers/bootstrap.bst
- oci/layers/bootstrap-init-script.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/bootstrap.bst
    destination: /layer
  - element: oci/layers/bootstrap-init-script.bst
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
    gzip: false
    images:
    - os: linux
      architecture: '%{go-arch}'
      layer: /layer
      comment: 'Import bootstrap layer from Freedesktop SDK'
    EOF
