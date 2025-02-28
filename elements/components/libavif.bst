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
  track: v1.1.*
  exclude:
  - "*rc*"
  ref: v1.1.1-0-gbb24db03cd99befe09c87b602e36f24d75a980d1
