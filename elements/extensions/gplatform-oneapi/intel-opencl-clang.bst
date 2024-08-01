kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

sources:
- kind: git_repo
  url: github:intel/opencl-clang
  directory: opencl-clang
  track: v*
  ref: v2.1.12-0-ge8896631295ccb0bfdda4284f1751be19b483264
- kind: git_repo
  url: github:llvm/llvm-project.git
  track: v*
  ref: v2.1.12-0-ge8896631295ccb0bfdda4284f1751be19b483264
- kind: git_repo
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  directory: SPIRV-LLVM-Translator
  track: v*
  ref: v2.1.12-0-ge8896631295ccb0bfdda4284f1751be19b483264