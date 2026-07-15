# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/_private/freetype-stage1.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/graphite2.bst
- components/icu.bst

variables:
  meson-local: >-
    -Dcairo=disabled
    -Dchafa=disabled
    -Dgraphite2=enabled
    -Dtests=disabled
    -Dgpu_demo=disabled

  target_flags_exceptions: ''

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libharfbuzz-*.so'
        - '%{libdir}/libharfbuzz.so'

sources:
- kind: git_repo
  url: github:harfbuzz/harfbuzz.git
  track: '*.*.*'
  ref: 14.2.1-0-g56feae4035bdd48f62ba2b8d8c16232d4d89b3a4
