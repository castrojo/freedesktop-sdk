# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- bootstrap/diffutils.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- components/python3-gi-docgen.bst
- components/python3-setuptools.bst

depends:
- components/glib.bst
- components/json-glib.bst
- components/libusb.bst
- components/vala.bst

variables:
  meson-local: >-
    -Dtests=false

sources:
- kind: git_repo
  url: github:hughsie/libgusb.git
  track: '*.*.*'
  ref: 0.4.9-0-ged31c8134d80d006bd45450e84180be2a7c0742e
