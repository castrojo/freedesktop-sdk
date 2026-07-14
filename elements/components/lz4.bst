# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

  cpe:
    vendor: lz4_project

variables:
  command-subdir: build/meson
  meson-local: -Dprograms=true

sources:
- kind: git_repo
  url: github:lz4/lz4.git
  track: v*
  ref: v1.10.0-0-gebb370ca83af193212df4dcbadcc5d87bc0de2f0
