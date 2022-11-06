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
  ref: release-2.0.5-0-gab2a9c602623193d61827ccd395302d92d90fc38
