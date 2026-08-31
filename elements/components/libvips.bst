# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: meson

build-depends:
- public-stacks/buildsystem-meson.bst
- components/doxygen.bst
- components/gobject-introspection.bst
- components/python3-gi-docgen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/cairo.bst
- components/expat.bst
- components/fftw.bst
- components/fontconfig.bst
- components/glib.bst
- components/highway.bst
- components/jpeg.bst
- components/lcms.bst
- components/libarchive.bst
- components/libexif.bst
- components/libheif.bst
- components/libjxl.bst
- components/libpng.bst
- components/librsvg.bst
- components/libtiff.bst
- components/libwebp.bst
- components/openjpeg.bst
- components/pango.bst
- components/poppler.bst
- components/zlib.bst

variables:
  meson-local: >-
    -Dcfitsio=disabled
    -Dcpp-docs=true
    -Ddocs=true
    -Dimagequant=disabled
    -Dmagick=disabled
    -Dmatio=disabled
    -Dnifti=disabled
    -Dopenexr=disabled
    -Dopenslide=disabled
    -Dpdfium=disabled
    -Dquantizr=disabled
    -Draw=disabled
    -Duhdr=disabled

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libvips.so'
        - '%{libdir}/libvips-cpp.so'

sources:
- kind: git_repo
  url: github:libvips/libvips.git
  track: v*.*.*
  exclude:
  - "*rc*"
  ref: v8.18.6-0-g426af3f44246fce9cfa8dd51a353aa4dfd48c553
