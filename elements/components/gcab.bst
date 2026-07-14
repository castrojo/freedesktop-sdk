# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/vala.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'

variables:
  meson-local: -Ddocs=false

sources:
- kind: git_repo
  url: gnome:gcab.git
  track: v*
  ref: v1.6-0-gb1a8a5867ccf0209d3e409b12986165c8f7a6fa4
