kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.2.198.0-0-g8c1c27d5a9b9de8a17f500053bd08c7ca6bba19c
  track: sdk-1.2.198
  match:
  - sdk-*
