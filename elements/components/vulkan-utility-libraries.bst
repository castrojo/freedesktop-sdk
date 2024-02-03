kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst

depends:
- bootstrap-import.bst

variables:
  command-subdir: vulkan-utility-libraries

(@):
- elements/include/vulkan-stack.yml
