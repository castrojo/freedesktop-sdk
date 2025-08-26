kind: cmake


build-depends:
- public-stacks/buildsystem-cmake.bst
- components/spirv-headers.bst

depends:
- public-stacks/runtime-minimal.bst
- components/llvm.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON
    -DCMAKE_SKIP_RPATH=ON
    -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR="%{prefix}"

config:
  install-commands:
    (>):
    - install -Dm755 -t "%{install-root}%{bindir}" 
      "%{build-dir}/tools/llvm-spirv/llvm-spirv"

sources:
- kind: git_repo
  # This needs to be in sync with LLVM version
  track: v21.*.*
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v21.1.0-0-gacb023b63a4bafd53d0ba6a1a452b1f0e5671458
