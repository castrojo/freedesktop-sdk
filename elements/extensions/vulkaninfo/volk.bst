kind: cmake

(@):
- elements/extensions/include/app.yml
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: volk/LICENSE.md
  cmake-local: >-
    -DVOLK_INSTALL:BOOL=ON
  command-subdir: volk
