kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/Vulkan-Headers.git
  ref: sdk-1.3.236.0-0-gb75e5a02b6933caf86c5822d019067b335492c85
  track: main
  track-extra:
  - sdk-1.3.236
  match:
  - sdk-*
