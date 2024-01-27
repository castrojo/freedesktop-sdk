kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  command-subdir: spirv-headers

(@):
- elements/include/vulkan-stack.yml
