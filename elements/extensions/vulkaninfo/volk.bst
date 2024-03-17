kind: cmake

(@):
- elements/extensions/include/app.yml
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DVOLK_INSTALL:BOOL=ON
  command-subdir: volk
