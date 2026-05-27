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
  ref: v1.1.0-0-gf0e5137ee10af674dcb5ac8ed5d02f5a102225af
