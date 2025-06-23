kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/sdl2-compat.bst

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
  track: release-*
  ref: release-2.4.0-0-g904600c6133e0435d627ec1878bfdfeac414a899
