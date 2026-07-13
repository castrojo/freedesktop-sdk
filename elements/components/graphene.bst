# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst

depends:
- public-stacks/runtime-minimal.bst
- components/glib.bst
- components/gobject-introspection.bst

variables:
  meson-local: >-
    -Dtests=false
    -Dinstalled_tests=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgraphene-1.0.so'
        - '%{libdir}/graphene-1.0/include/*'

sources:
- kind: git_repo
  url: github:ebassi/graphene.git
  track: "*.*.*"
  ref: 1.10.8-0-g4e2578450809c2099400cf85caf18eafcd7100aa
