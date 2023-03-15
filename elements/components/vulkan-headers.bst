kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: sdk-*
  ref: sdk-1.3.239.0-0-g2bb0a23104ceffd9a28d5b7401f2cee7dae35bb8
