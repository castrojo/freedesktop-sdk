# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/llvm.yml
- elements/extensions/mesa/config.yml

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/llvm.bst
- components/spirv-tools.bst
- components/spirv-llvm-translator.bst
- components/python3.bst

variables:
  cmake: cmake "-B%{build-dir}" -Slibclc -G"%{generator}" %{cmake-args}
