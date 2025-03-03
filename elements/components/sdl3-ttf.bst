kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
  ref: release-3.2.0-0-g3675de381020a719c37f7c79f6564cf52c8f4dcc
