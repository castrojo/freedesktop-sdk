kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libflac.bst
- components/libvorbis.bst
- components/mpg123.bst
- components/sdl2.bst
- components/opusfile.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'

sources:
- kind: git_tag
  url: github:libsdl-org/SDL_mixer.git
  track: main
  track-extra:
  - release-2.6.x
  match:
  - 'release*'
  ref: release-2.6.2-0-g75f318100d220e236c4fcc5a3d0c9ba33d064f3f
