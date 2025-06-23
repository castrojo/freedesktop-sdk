kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- components/freetype.bst
- components/sdl3.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL3_ttf.so'
        - '%{libdir}/libSDL3_ttf-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_ttf.git
  track: release-*
  ref: release-3.2.2-0-ga1ce3670aec736ecbf0936c43f2f0cc53aa61e5b
