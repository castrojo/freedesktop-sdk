kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: vulkan-utility-libraries

(@):
- elements/include/vulkan-stack.yml
