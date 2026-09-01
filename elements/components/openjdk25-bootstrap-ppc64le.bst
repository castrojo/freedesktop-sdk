# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - |
    set -e

    install -d "%{install-root}%{libdir}/jvm/openjdk-25"
    cp -a . "%{install-root}%{libdir}/jvm/openjdk-25/"

sources:
- kind: tar
  url: github_files:adoptium/temurin25-binaries/releases/download/jdk-25%2B36/OpenJDK25U-jdk_ppc64le_linux_hotspot_25_36.tar.gz
  ref: b060bb12b3a192a0599f03ebb9495492f78c48cb61e291e336a8b00e7798ffb0
