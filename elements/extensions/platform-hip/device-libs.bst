kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- extensions/platform-hip/rocm-llvm.bst

variables:
  conf-root: amd/device-libs

(@):
- elements/extensions/platform-hip/rocm-source.yml
