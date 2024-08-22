kind: cmake

build-depends:
- components/numactl.bst
- extensions/platform-hip/rocm-llvm.bst
- extensions/platform-hip/libdrm.bst
- public-stacks/buildsystem-cmake.bst
- extensions/platform-hip/roct.bst
- components/vim.bst # provides xxd

variables:
  conf-root: src
  cmake-local: >-
    -DIMAGE_SUPPORT=OFF

sources:
- kind: git_repo
  url: github:ROCm/ROCR-Runtime.git
  track: rocm-*
  ref: rocm-6.2.0-0-g1d1b8456c3530e7b464f6d74ed0baa2b28345126
