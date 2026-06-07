kind: cmake

(@): elements/extensions/ffmpeg-full/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst
- components/sdl2.bst

variables:
  cmake-local: >-
    -DENABLE_SDL=ON
    -DBUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:strukturag/libde265.git
  track: v*
  ref: v1.1.1-0-g4dd701fffac01632ffd5cabc5ef10deb56accba1
