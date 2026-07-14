# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- filename: oci/layers/debug.bst
  config:
    location: /layer

- oci/layers/sdk-init-script.bst
- oci/oci-builder.bst
- filename: oci/sdk-oci.bst
  config:
    location: /parent

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
    images:
    - os: linux
      architecture: "%{go-arch}"
      parent:
        image: /parent
      layer: /layer
      comment: "Import debug layer from Freedesktop SDK"
      index-annotations:
        org.opencontainers.image.ref.name: localhost/freedesktopsdk/debug:latest
    EOF
