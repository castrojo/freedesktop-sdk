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
- components/svt-av1.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DAVIF_BUILD_GDK_PIXBUF=ON
    -DAVIF_CODEC_AOM=SYSTEM
    -DAVIF_CODEC_DAV1D=SYSTEM
    -DAVIF_CODEC_SVT=SYSTEM
    -DAVIF_LIBYUV=OFF
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

sources:
- kind: git_repo
  url: github:AOMediaCodec/libavif.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.1.0-0-g183485b155ff8e56501753d0f73b6c58bb170a24
