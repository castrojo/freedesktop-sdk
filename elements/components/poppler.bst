kind: cmake_recc

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/gobject-introspection.bst
- components/gtk-doc.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- components/cairo.bst
- components/fontconfig.bst
- components/freetype.bst
- components/glib.bst
- components/jpeg.bst
- components/lcms.bst
- components/nss.bst
- components/openjpeg.bst
- components/gpgmepp.bst
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
  ref: poppler-26.04.0-0-gb3a22fbfc627409044959a11a2c51afc555ac718
