kind: cmake

depends:
- bootstrap-import.bst
- components/llvm.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/spirv-headers.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="%{prefix}"

config:
  install-commands:
    (>):
    - install -Dm755 -t "%{install-root}%{bindir}" "%{build-dir}/tools/llvm-spirv/llvm-spirv"

sources:
- kind: git_repo
  # This needs to be in sync with LLVM version
  track: llvm_release_170
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v17.0.0-18-g89ab5df345a36940c3a313b3cbd875e32bae366e
