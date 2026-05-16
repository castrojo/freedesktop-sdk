kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/sdl2.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_net.so'
        - '%{libdir}/libSDL2_net-2.0.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_net.git
  track: release-2.*
  ref: release-2.4.0-0-g904600c6133e0435d627ec1878bfdfeac414a899
- kind: patch
  path: patches/sdl2-net/cmake-pkgconfig.patch
