kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: sdk-*
  ref: sdk-1.3.250.1-0-g9e61870ecbd32514113b467e0a0c46f60ed222c7
