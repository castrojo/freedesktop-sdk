kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/sdl2-compat.bst
- components/jpeg.bst
- components/libavif.bst
- components/libpng.bst
- components/libtiff.bst
- components/libwebp.bst

variables:
  cmake-local: >-
    -DSDL2IMAGE_DEPS_SHARED:BOOL=OFF
    -DSDL2IMAGE_TIF:BOOL=ON
    -DSDL2IMAGE_WEBP:BOOL=ON
    -DSDL2IMAGE_AVIF:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_image.so'
        - '%{libdir}/libSDL2_image-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_image.git
  track: release-*
  ref: release-3.2.0-0-g4a762bdfb7b43dae7a8a818567847881e49bdab4
