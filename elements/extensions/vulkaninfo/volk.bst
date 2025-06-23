kind: cmake-recc

(@):
- elements/extensions/include/app.yml
- elements/include/vulkan-stack.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/vulkan-headers.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-files-extra: volk/LICENSE.md
  cmake-local: >-
    -DVOLK_INSTALL:BOOL=ON
  command-subdir: volk
