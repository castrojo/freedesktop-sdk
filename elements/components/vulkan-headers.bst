kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  license-files-extra: |
    vulkan-headers/LICENSES/Apache-2.0.txt \
    vulkan-headers/LICENSES/MIT.txt
  command-subdir: vulkan-headers

(@):
- elements/include/vulkan-stack.yml
