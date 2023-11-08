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
- components/gpgme.bst
- components/curl.bst

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
  ref: poppler-23.11.0-0-g975d6998b0ad979e81ea133be493bbf7be113fc7
