kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- extensions/platform-hip/rocm-llvm.bst
- extensions/platform-hip/device-libs.bst

variables:
  conf-root: amd/comgr

  cmake-local: >-
    -DBUILD_TESTING=OFF

(@):
- elements/extensions/platform-hip/rocm-source.yml
