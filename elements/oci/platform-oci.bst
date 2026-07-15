# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- oci/layers/platform-init-script.bst
- filename: oci/layers/platform.bst
  config:
    location: /layer

- filename: oci/minimal-oci.bst
  config:
    location: /parent
- oci/oci-builder.bst

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
