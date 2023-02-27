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
  ref: release-2.20.2-0-g89d1692fd8fe91a679bb943d377bfbd709b52c23
