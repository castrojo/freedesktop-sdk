# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/docbook-xsl.bst
- components/libxslt.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libcap.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:projectatomic/bubblewrap.git
  track: v*
  ref: v0.13.0-0-g719a4fd474d44b26906bcf2b1b0fb6eddd8d56d0
