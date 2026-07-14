# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@): elements/include/glycin-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/gobject-introspection.bst
- components/rust.bst
- components/vala.bst

depends:
- public-stacks/runtime-minimal.bst
- components/fontconfig.bst
- components/glib.bst
- components/lcms.bst
- components/libseccomp.bst

variables:
  meson-local: >-
    -Dlibglycin-gtk4=false
    -Dglycin-thumbnailer=false
    -Dglycin-loaders=false

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libglycin-2.so'
