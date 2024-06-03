kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/aom.bst
- components/dav1d.bst
- components/jpeg.bst
- components/gdk-pixbuf.bst
- components/libwebp.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DAVIF_BUILD_GDK_PIXBUF=ON
    -DAVIF_CODEC_AOM=ON
    -DAVIF_CODEC_DAV1D=ON
    -DAVIF_BUILD_EXAMPLES=OFF
    -DAVIF_BUILD_APPS=OFF
    -DAVIF_BUILD_TESTS=OFF
    -DVIF_ENABLE_GTEST=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libavif.so'
        - '%{libdir}/cmake'
        - '%{libdir}/cmake/**'

  integration-commands:
  - |
    gdk-pixbuf-query-loaders --update-cache

sources:
- kind: git_repo
  url: github:AOMediaCodec/libavif.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.0.4-0-gd77cfece0b3e233ee4bed49dfef1e7dc451599f8
