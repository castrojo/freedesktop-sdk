# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libqrtr-glib.so'

sources:
- kind: git_repo
  url: freedesktop:mobile-broadband/libqrtr-glib.git
  track: '*.*.*'
  ref: 1.4.0-0-g69791f8f2a092d0ec8eb83cbe51dfc3d157c3079
