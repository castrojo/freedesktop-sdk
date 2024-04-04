kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/freetype.bst
- components/sdl2.bst

variables:
  conf-local: >-
    --disable-harfbuzz-builtin
    --disable-freetype-builtin

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_ttf.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_ttf.git
  track: release-*
  ref: release-2.20.0-0-gf5e4828ffc9d3a84f00011fede4446aecb4a685f
