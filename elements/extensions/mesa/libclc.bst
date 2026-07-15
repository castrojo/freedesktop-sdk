# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

(@):
- elements/include/llvm.yml
- elements/extensions/mesa/config.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/llvm.bst
- components/python3.bst
- components/spirv-llvm-translator.bst
- components/spirv-tools.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake: cmake "-B%{build-dir}" -Slibclc -G"%{generator}" %{cmake-args}
