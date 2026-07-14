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

variables:
  meson-local: -Ddocs=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgcab-1.0.so'

sources:
- kind: git_repo
  url: gnome:gcab.git
  track: v*
  ref: v1.6-0-gb1a8a5867ccf0209d3e409b12986165c8f7a6fa4
