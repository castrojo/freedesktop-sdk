kind: cmake

(@): elements/extensions/codecs-extra/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/sdl2-compat.bst

variables:
  cmake-local: >-
    -DENABLE_SDL=ON
    -DBUILD_SHARED_LIBS=ON

sources:
- kind: git_repo
  url: github:strukturag/libde265.git
  track: v*
  ref: v1.0.15-0-g17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4
- kind: patch
  path: patches/libde265/missing-cstring.patch
