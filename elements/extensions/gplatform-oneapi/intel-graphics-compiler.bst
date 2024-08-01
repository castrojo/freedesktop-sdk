kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  conf-root: igc

  cmake-local: >-
    -DIGC_OPTION__LLVM_MODE="Source"

sources:
- kind: git_repo
  url: github:intel/vc-intrinsics.git
  directory: vc-intrinsics
  track: v*.*
  ref: v0.19.0-0-g8d2e809368443305155370573f3c6db8279ed87d
- kind: git_repo
  url: github:llvm/llvm-project.git
  track: llvmorg-14.0.5
  directory: llvm-project
  exclude:
  - llvmorg-*-rc*
  - llvmorg-*-init*
  ref: llvmorg-14.0.5-0-gc12386ae247c0d46e1d513942e322e3a0510b126
- kind: git_repo
  url: github:intel/opencl-clang.git
  directory: llvm-project/llvm/projects/opencl-clang
  track: v14.*
  ref: v14.0.0-0-g06c7c0d7f5cbd13810d79489a533fa6c5b6c7d9f
- kind: git_repo
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  directory: llvm-project/llvm/projects/llvm-spirv
  track: v14.*
  ref: v14.0.3-0-g065a94408d01bacf2ee86443f56cfaa64fda1534
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Tools.git
  directory: SPIRV-Tools
  track: vulkan-sdk-*
  ref: vulkan-sdk-1.3.290.0-0-g0cfe9e7219148716dfd30b37f4d21753f098707a
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Headers.git
  directory: SPIRV-Headers
  track: vulkan-sdk-*
  ref: vulkan-sdk-1.3.290.0-0-g2acb319af38d43be3ea76bfabf3998e5281d8d12
- kind: git_repo
  url: github:intel/intel-graphics-compiler.git
  directory: igc
  track: igc-*.*
  ref: igc-19.12.1681-0-g81d467882a26d57da18e7f6d8aa3a28cda842642
