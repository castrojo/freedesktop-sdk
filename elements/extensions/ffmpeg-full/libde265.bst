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
  ref: v1.0.16-0-g7ba65889d3d6d8a0d99b5360b028243ba843be3a
