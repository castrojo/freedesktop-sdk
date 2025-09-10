kind: cmake

(@):
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: |
    vulkan-headers/LICENSES/Apache-2.0.txt \
    vulkan-headers/LICENSES/MIT.txt
  command-subdir: vulkan-headers
