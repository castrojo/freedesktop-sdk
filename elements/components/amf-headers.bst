# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p "%{install-root}%{includedir}"
  - cp -r AMF "%{install-root}%{includedir}"

sources:
- kind: tar
  url: github_files:GPUOpen-LibrariesAndSDKs/AMF/releases/download/v1.5.2/AMF-headers-v1.5.2.tar.gz
  ref: d3c12eb324edf05e214608b6a395a51dd95770ed9d45520185d6c3a206811c99
