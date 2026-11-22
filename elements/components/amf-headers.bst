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
- kind: anitya
  project-id: 138182
  url: github_files:GPUOpen-LibrariesAndSDKs/AMF/releases/download/v{version}/AMF-headers-v{version}.tar.gz
  ref:
    version: 1.5.3
    sha256sum: 0f521ad98041f8001147cded4a660127f18b1c27a801a5cd691bda1fa48381be
