kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Headers.git
  track: vulkan-sdk-*
  ref: sdk-1.3.261.0-0-g124a9665e464ef98b8b718d572d5f329311061eb
