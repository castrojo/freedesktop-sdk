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
  track: v20.*.*
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v20.1.5-0-gae16e687166062b39b986610988d4251338823c2
