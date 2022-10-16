kind: cmake

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.3.224.0-0-gc896e2f920273bfee852da9cca2a356bc1c2031e
  track: main
  track-extra:
  - sdk-1.3.224
  match:
  - sdk-*
