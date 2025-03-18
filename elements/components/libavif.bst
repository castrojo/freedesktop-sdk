kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
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
    -DAVIF_ENABLE_GTEST=OFF

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
  ref: v1.2.1-0-gfcb084c9387e367750f5375e462005ce298f57cc
