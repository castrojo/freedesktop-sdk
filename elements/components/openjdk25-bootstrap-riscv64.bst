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
  url: github_files:adoptium/temurin25-binaries/releases/download/jdk-25%2B36/OpenJDK25U-jdk_riscv64_linux_hotspot_25_36.tar.gz
  ref: 3fc35759502b620f010a9cd2b3da8454f8a49a156ceaebb00de1fd8335682d40
