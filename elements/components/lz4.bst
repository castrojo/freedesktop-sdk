# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: build/meson
  meson-local: -Dprograms=true

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/liblz4.so'

  cpe:
    vendor: lz4_project

sources:
- kind: git_repo
  url: github:lz4/lz4.git
  track: v*
  ref: v1.11.1-0-gaa4647fad575d01a874aaaadcdbe8e6a40e072f5
