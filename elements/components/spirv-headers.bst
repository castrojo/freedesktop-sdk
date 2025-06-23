kind: cmake

(@):
- elements/include/vulkan-stack.yml
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: spirv-headers/LICENSE
  command-subdir: spirv-headers
