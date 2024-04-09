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
- kind: git_repo
  url: github:libsdl-org/SDL_mixer.git
  track: release-2.6.*
  ref: release-2.6.3-0-g6103316427a8479e5027e41ab9948bebfc1c3c19
