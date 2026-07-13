# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libflac.bst
- components/libvorbis.bst
- components/mpg123.bst
- components/sdl3.bst
- components/opusfile.bst
- components/wavpack.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DSDLMIXER_INSTALL=ON
    -DSDLMIXER_INSTALL_MAN=ON
    -DSDLMIXER_DEPS_SHARED=ON
    -DSDLMIXER_VENDORED=OFF
    -DSDLMIXER_STRICT=ON
    -DSDLMIXER_TESTS=OFF
    -DSDLMIXER_EXAMPLES=OFF
    -DSDLMIXER_EXAMPLES_INSTALL=OFF
    -DSDLMIXER_GME=OFF
    -DSDLMIXER_MOD_XMP=OFF
    -DSDLMIXER_MIDI_FLUIDSYNTH=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL3_mixer.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_mixer.git
  track: release-*
  ref: release-3.2.4-0-g72a81869b45e249e8e67102db4e98dd2441f05a1
