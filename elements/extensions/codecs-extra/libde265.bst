kind: cmake

(@):
- elements/extensions/codecs-extra/config.yml

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
  ref: v1.0.18-0-g36ad04841c209cb8b3577ec2723d431b6bf7efa0
