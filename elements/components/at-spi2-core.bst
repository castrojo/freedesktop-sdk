# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/dbus.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/libdbus.bst

variables:
  meson-local: >-
    -Dx11=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libatk-1.0.so'
        - '%{libdir}/libatk-bridge-2.0.so'
        - '%{libdir}/libatspi.so'

  cpe:
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:at-spi2-core.git
  track: "*.[02468].*"
  ref: 2.62.0.1-0-gb33ff15213c4c09dfc0a5b261875c65c7cffd91d
