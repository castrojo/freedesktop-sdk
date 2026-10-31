# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/cmake.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/glib-networking.bst
- components/libnghttp2.bst
- components/libpsl.bst
- components/libxml2.bst
- components/sqlite.bst

variables:
  meson-local: >
    -Dgssapi=disabled
    -Dvapi=disabled
    -Dntlm=disabled
    -Dsysprof=disabled
    -Dautobahn=disabled
    -Dpkcs11_tests=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libsoup-3.0.so'
        - '%{libdir}/libsoup-gnome-3.0.so'

sources:
- kind: git_repo
  url: gnome:libsoup.git
  track: 3.[02468].*
  ref: 3.8.1-0-g2756d0076654b680d2021a08b9f2bd9d36d7ae1b
