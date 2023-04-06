kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: sdk-*
  ref: sdk-1.3.243.0-0-g65ad768d8603671fc1085fe115019e72a595ced8
