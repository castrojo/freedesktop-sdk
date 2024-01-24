kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/freetype.bst
- components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_ttf.so'
        - '%{libdir}/libSDL2_ttf-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_ttf.git
  track: release-*
  ref: release-2.22.0-0-g4a318f8dfaa1bb6f10e0c5e54052e25d3c7f3440
