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
- kind: git_repo
  # This needs to be in sync with LLVM version
  track: llvm_release_160
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v16.0.0-2-g54318313923c34dee4d9e3aee2d65314148b05eb
