kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst
- filename: components/jpeg.bst
- filename: components/libpng.bst
- filename: components/libtiff.bst
- filename: components/libwebp.bst

variables:
  conf-local: >-
    --disable-jpg-shared
    --disable-png-shared
    --disable-tif-shared
    --disable-webp-shared

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_image.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_image.git
  track: main
  track-extra:
  - release-2.6.x
  match:
  - release-*
  ref: release-2.6.2-0-ga861543ab78f5d5e18e6af43964ce8df60cb30b3
