kind: cmake

build-depends:
- components/gobject-introspection.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-cmake.bst

depends:
- components/cairo.bst
- components/fontconfig.bst
- components/freetype.bst
- components/glib.bst
- components/jpeg.bst
- components/lcms.bst
- components/nss.bst
- components/openjpeg.bst

variables:
  cmake-local: >-
    -DENABLE_QT5=OFF
    -DENABLE_QT6=OFF
    -DENABLE_BOOST=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libpoppler-cpp.so'
        - '%{libdir}/libpoppler-glib.so'
        - '%{libdir}/libpoppler.so'

sources:
- kind: git_repo
  url: freedesktop:poppler/poppler.git
  track: poppler-*
  ref: poppler-23.05.0-0-gadf710eecf475dd7c64d7b904f7414ec3098491f
