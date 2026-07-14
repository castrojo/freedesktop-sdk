# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- components/gobject-introspection.bst
- components/python3-docutils.bst
- components/python3-gi-docgen.bst
- public-stacks/buildsystem-meson.bst

depends:
- components/glib.bst
- public-stacks/runtime-minimal.bst


variables:
  meson-local: >-
    -Dinstalled_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjson-glib-1.0.so'

sources:
- kind: git_repo
  url: gnome:json-glib.git
  track: '*.*.*'
  ref: 1.10.8-0-g8273a7d2539c115c0eb1bcc9e8cd9d26fcde204a
