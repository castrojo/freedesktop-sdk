# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
    - install -Dm755 -t "%{install-root}%{bindir}" "%{build-dir}/tools/llvm-spirv/llvm-spirv"

sources:
- kind: git_repo
  # This needs to be in sync with LLVM version
  track: v22.*.*
  url: github:KhronosGroup/SPIRV-LLVM-Translator.git
  ref: v22.1.3-0-ge10ca9b403e3f3ae09d2425a6b20ed546126b862
