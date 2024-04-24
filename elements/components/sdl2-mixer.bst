kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/libflac.bst
- components/libvorbis.bst
- components/mpg123.bst
- components/sdl2.bst
- components/opusfile.bst
- components/wavpack.bst

variables:
  cmake-local: >-
    -DSDL2MIXER_MOD:BOOL=OFF
    -DSDL2MIXER_MIDI:BOOL=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL2_mixer.so'
        - '%{libdir}/libSDL2_mixer-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_mixer.git
  track: release-*
  ref: release-2.8.0-0-ga37e09f85d321a13dfcf0d4432827ee09beeb623
