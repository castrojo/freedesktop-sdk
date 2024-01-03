kind: cmake

build-depends:
- components/gobject-introspection.bst
- components/gtk-doc.bst
- public-stacks/buildsystem-cmake.bst

depends:
- components/cairo.bst
- components/curl.bst
- components/fontconfig.bst
- components/freetype.bst
- components/glib.bst
- components/gpgme.bst
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
- kind: git_tag
  url: freedesktop:poppler/poppler.git
  track: master
  ref: poppler-24.01.0-0-g87963f675f3532073c1d71c7ba298289485bc7f7
