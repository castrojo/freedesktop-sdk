# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gdk-pixbuf.bst
- components/glib.bst

variables:
  meson-local: >-
    -Ddocbook_docs=disabled
    -Dman=false
    -Dtests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnotify.so'

  cpe:
    vendor: 'gnome'

sources:
- kind: git_repo
  url: gnome:libnotify.git
  track: '*.*.*'
  ref: 0.8.9-0-g9b53a46b0307fe3a7ddd2545de1e395ee2f94d18
