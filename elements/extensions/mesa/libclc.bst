kind: cmake

(@):
- elements/include/llvm.yml
- elements/extensions/mesa/config.yml

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/llvm.bst
- components/python3.bst
- components/spirv-llvm-translator.bst
- components/spirv-tools.bst
- (@): include/_private/gcc-for-recc.yml

variables:
  cmake: cmake "-B%{build-dir}" -Slibclc -G"%{generator}" %{cmake-args}
