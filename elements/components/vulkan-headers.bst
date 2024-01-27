kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  command-subdir: vulkan-headers

(@):
- elements/include/vulkan-stack.yml
