kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/freetype.bst
- components/sdl2-compat.bst

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
  ref: release-2.24.0-0-g2a891473eaf05ba1707a4b7913e6c4db7de7458a
