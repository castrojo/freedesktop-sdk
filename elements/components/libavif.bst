kind: cmake_recc

build-depends:
- public-stacks/buildsystem-cmake.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
      pixbufloader:
      - "%{libdir}/gdk-pixbuf-2.0"
      - "%{libdir}/gdk-pixbuf-2.0/**"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0"
      - "%{debugdir}%{libdir}/gdk-pixbuf-2.0/**"
      - "%{sourcedir}/%{element-name}/contrib/gdk-pixbuf"
      - "%{sourcedir}/%{element-name}/contrib/gdk-pixbuf/**"
      thumbnailer:
      - "%{datadir}/thumbnailers"
      - "%{datadir}/thumbnailers/**"

sources:
- kind: git_repo
  url: github:AOMediaCodec/libavif.git
  track: v*
  exclude:
  - "*rc*"
  ref: v1.4.1-0-g6543b22b5bc706c53f038a16fe515f921556d9b3
