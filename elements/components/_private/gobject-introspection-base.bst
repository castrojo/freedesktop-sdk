# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/bison.bst
- components/flex.bst
- components/_private/glib-stage1.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/python3.bst
- components/python3-mako.bst
- components/python3-markdown.bst
- components/python3-setuptools.bst # https://gitlab.gnome.org/GNOME/gobject-introspection/-/issues/395

variables:
  meson-local: >-
    -Dcairo=disabled
    -Dgtk_doc=true
    -Ddoctool=enabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/gobject-introspection/giscanner'
        - '%{libdir}/gobject-introspection/giscanner/**'
        - '%{datadir}/gir-1.0'
        - '%{datadir}/gir-1.0/**'
        - '%{datadir}/gobject-introspection-1.0'
        - '%{datadir}/gobject-introspection-1.0/**'
        - '%{bindir}/g-ir-*'
        - '%{libdir}/libgirepository-1.0.so'
  cpe:
    product: gobject-introspection

sources:
- kind: git_repo
  url: gnome:gobject-introspection.git
  track: "*.*[02468].*"
  ref: 1.86.0-0-g0f1412500b7d9039510b7b36b07c9f8ba0809bfa
- kind: git_module
  url: gnome:gobject-introspection-tests.git
  path: gobject-introspection-tests
  ref: 67a03e86da0636c02cac2390ee2f0d5d981875a8
