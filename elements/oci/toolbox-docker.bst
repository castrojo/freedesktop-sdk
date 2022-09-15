kind: script

(@): flatpak-version.yml

build-depends:
- oci/oci-builder.bst
- oci/sdk-oci.bst
- oci/layers/toolbox.bst
- oci/layers/toolbox-init-script.bst

config:
  layout:
  - element: oci/oci-builder.bst
    destination: /
  - element: oci/layers/toolbox.bst
    destination: /layer
  - element: oci/sdk-oci.bst
    destination: /parent
  - element: oci/layers/toolbox-init-script.bst
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
    mode: docker
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Make the image toolbox ready"
      tags:
      - freedesktopsdk/toolbox:latest
      config:
        Labels:
          'com.github.containers.toolbox': 'true'
          'com.github.debarshiray.toolbox': 'true'
    EOF
