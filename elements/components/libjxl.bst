kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/asciidoc.bst
- components/doxygen.bst

depends:
- public-stacks/runtime-minimal.bst
- components/brotli.bst
- components/gdk-pixbuf.bst
- components/highway.bst
- components/jpeg.bst
- components/lcms.bst
- components/libpng.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libjxl.so'
        - '%{libdir}/libjxl_cms.so'
        - '%{libdir}/libjxl_threads.so'
      pixbufloader:
      - "%{libdir}/gdk-pixbuf-2.0"
      - "%{libdir}/gdk-pixbuf-2.0/**"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0/**"
      - "%{sourcedir}/%{element-name}/plugins/gdk-pixbuf"
      - "%{sourcedir}/%{element-name}/plugins/gdk-pixbuf/**"
      thumbnailer:
      - "%{datadir}/thumbnailers"
      - "%{datadir}/thumbnailers/**"

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DJPEGXL_BUNDLE_LIBPNG=OFF
    -DJPEGXL_ENABLE_BENCHMARK=OFF
    -DJPEGXL_ENABLE_COVERAGE=OFF
    -DJPEGXL_ENABLE_DEVTOOLS=OFF
    -DJPEGXL_ENABLE_EXAMPLES=OFF
    -DJPEGXL_ENABLE_FUZZERS=OFF
    -DJPEGXL_ENABLE_JPEGLI=OFF
    -DJPEGXL_ENABLE_OPENEXR=OFF
    -DJPEGXL_ENABLE_PLUGINS=ON
    -DJPEGXL_ENABLE_PLUGIN_GIMP210=OFF
    -DJPEGXL_ENABLE_SJPEG=OFF
    -DJPEGXL_ENABLE_SKCMS=OFF
    -DJPEGXL_ENABLE_TCMALLOC=OFF
    -DJPEGXL_ENABLE_TOOLS=OFF
    -DJPEGXL_ENABLE_VIEWERS=OFF
    -DJPEGXL_FORCE_SYSTEM_BROTLI=ON
    -DJPEGXL_FORCE_SYSTEM_HWY=ON
    -DJPEGXL_FORCE_SYSTEM_LCMS2=ON
    -DJPEGXL_STATIC=OFF
    -DJPEGXL_TEST_TOOLS=OFF
    -DJPEGXL_WARNINGS_AS_ERRORS=OFF
    -DJPEGXL_BUNDLE_LIBPNG=OFF
    -DJPEGXL_ENABLE_DOXYGEN=ON

sources:
- kind: git_repo
  url: github:libjxl/libjxl.git
  track: v*
  exclude:
  - "*rc*"
  - "*snapshot*"
  - "*base*"
  ref: v0.11.1-0-g794a5dcf0d54f9f0b20d288a12e87afb91d20dfc
