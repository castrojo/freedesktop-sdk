kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/sdl3.bst
- components/jpeg.bst
- components/libavif.bst
- components/libpng.bst
- components/libtiff.bst
- components/libwebp.bst
- components/libjxl.bst

variables:
  cmake-local: >-
    -DSDLIMAGE_DEPS_SHARED:BOOL=OFF
    -DSDLIMAGE_TIF:BOOL=ON
    -DSDLIMAGE_WEBP:BOOL=ON
    -DSDLIMAGE_AVIF:BOOL=ON
    -DSDLIMAGE_JXL:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL3_image.so'
        - '%{libdir}/libSDL3_image-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_image.git
  track: release-*
  ref: release-3.2.2-0-g2642f5892ba45f3d887515ae9120e67499b11635
