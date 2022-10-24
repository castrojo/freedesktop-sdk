kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/sdl2.bst

variables:
  conf-local: |
    --disable-gui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_net.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_net.git
  ref: release-2.0.1-0-g6e513e390d18ad7950d9082863bfe33a0c62fd71
