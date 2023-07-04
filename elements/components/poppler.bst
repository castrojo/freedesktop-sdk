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
- kind: git_tag
  url: freedesktop:poppler/poppler.git
  track: master
  ref: poppler-23.07.0-0-g639efb3d3b08fb10fb84976cb6db98ea929e9486
