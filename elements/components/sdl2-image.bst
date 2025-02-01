kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/sdl2.bst
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
  track: release-2.*
  ref: release-2.8.4-0-g4641fd73853a60a448a2f352a865633bec6140e8
