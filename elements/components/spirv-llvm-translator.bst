kind: cmake

depends:
- bootstrap-import.bst
- components/llvm.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/spirv-headers.bst

variables:
  cmake-local: >-
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="%{prefix}"

config:
  build-commands:
  - '%{make} llvm-spirv'

  install-commands:
  - install -Dm755 -t "%{install-root}%{bindir}/" _builddir/tools/llvm-spirv/llvm-spirv

sources:
- kind: git_tag
  # This needs to be in sync with LLVM version
  track: llvm_release_150
  track-tags: false
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v15.0.0-69-gba7f92a04bbfd65e3e9b0b7e0c18bfbba4aa81f4
  match:
  - v*
