kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  license-files-extra: spirv-headers/LICENSE
  command-subdir: spirv-headers

(@):
- elements/include/vulkan-stack.yml
