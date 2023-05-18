kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/Vulkan-Headers.git
  track: sdk-*
  ref: sdk-1.3.246.1-0-g63af1cf1ee906ba4dcd5a324bdd0201d4f4bfd12
