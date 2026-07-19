# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: manual

build-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  strip-binaries: ''

config:
  install-commands:
  - mkdir -p "%{install-root}%{includedir}"
  - cp -r AMF "%{install-root}%{includedir}"

sources:
- kind: tar
  url: github_files:GPUOpen-LibrariesAndSDKs/AMF/releases/download/v1.5.0/AMF-headers-v1.5.0.tar.gz
  ref: d569647fa26f289affe81a206259fa92f819d06db1e80cc334559953e82a3f01
