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
  ref: release-2.22.0-0-g4a318f8dfaa1bb6f10e0c5e54052e25d3c7f3440
