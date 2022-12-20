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
- kind: git_repo
  url: github:libsdl-org/SDL_image.git
  track: release-*
  ref: release-2.6.3-0-gd3c6d5963dbe438bcae0e2b6f3d7cfea23d02829
