# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/jpeg.bst
- components/libavif.bst
- components/libjxl.bst
- components/libpng.bst
- components/libtiff.bst
- components/libwebp.bst
- components/sdl3.bst

variables:
  cmake-local: >-
    -DSDLIMAGE_DEPS_SHARED:BOOL=OFF
    -DSDLIMAGE_TIF:BOOL=ON
    -DSDLIMAGE_WEBP:BOOL=ON
    -DSDLIMAGE_AVIF:BOOL=ON
    -DSDLIMAGE_JXL:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libSDL3_image.so'
        - '%{libdir}/libSDL3_image-*.so'

sources:
- kind: git_repo
  url: github:libsdl-org/SDL_image.git
  track: release-*
  ref: release-3.4.6-0-gf661fa1ad24ab1b81e43662532f9a6a9fcf67ea6
