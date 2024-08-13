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
  track: llvm_release_180
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v18.1.3-1-gd0e241f4215c06c11b1056f82c62d83f1af94bc0
