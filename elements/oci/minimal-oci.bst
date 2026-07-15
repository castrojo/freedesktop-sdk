# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: script

build-depends:
- oci/layers/minimal-init-script.bst
- filename: oci/layers/minimal.bst
  config:
    location: /layer

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
      architecture: '%{go-arch}'
      layer: /layer
      comment: 'Import minimal layer from Freedesktop SDK'
    EOF
