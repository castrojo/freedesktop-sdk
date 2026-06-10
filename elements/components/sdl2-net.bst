kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
  ref: release-3.2.0-0-g1a84a2a6b9663572f77e2eb5348d42845bac0053
