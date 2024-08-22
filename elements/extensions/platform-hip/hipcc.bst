kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=OFF
  conf-root: amd/hipcc

(@):
- elements/extensions/platform-hip/rocm-source.yml