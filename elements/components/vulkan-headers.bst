kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: vulkan-sdk-*
  ref: sdk-1.3.261.1-0-g85c2334e92e215cce34e8e0ed8b2dce4700f4a50
