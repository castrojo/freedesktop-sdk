# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

(@): elements/include/glycin-source.yml

build-depends:
- public-stacks/buildsystem-meson.bst
- components/rust.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/libglycin.bst
- components/libheif.bst
- components/libjxl.bst
- components/librsvg.bst
- components/libseccomp.bst

variables:
  # Don't build libglycin since it's already built in libglycin.bst
  # Disable tests because they depend on gtk4
  meson-local: >-
    -Dlibglycin=false
    -Dlibglycin-gtk4=false
    -Dtests=false
