# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/ca-certificates.bst
- components/glib.bst
- components/gnutls.bst
- components/gsettings-desktop-schemas.bst
- components/libproxy.bst

variables:
  meson-local: |
    -Dlibproxy=enabled

sources:
- kind: git_repo
  url: gnome:glib-networking.git
  track: 2.*[02468].*
  exclude:
  - '*alpha*'
  - '*beta*'
  - '*rc*'
  ref: 2.90.0-0-gc7343cea63d4ba64d0c9f5ec1c23f0570dc48b87
