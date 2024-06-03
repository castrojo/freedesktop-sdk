kind: cmake

build-depends:
- components/asciidoc.bst
- components/doxygen.bst
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
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

  integration-commands:
  - |
    gdk-pixbuf-query-loaders --update-cache

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
  ref: v0.10.2-0-ge1489592a770b989303b0edc5cc1dc447bbe0515
