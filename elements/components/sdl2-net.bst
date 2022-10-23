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
- kind: git_tag
  url: github:libsdl-org/SDL_net.git
  track: main
  ref: release-2.2.0-0-g669e75b84632e2c6cc5c65974ec9e28052cb7a4e
