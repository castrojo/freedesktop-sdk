kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  track: sdk-1.2.198
  match:
  - sdk-*
  ref: sdk-1.2.198.0-0-g814e728b30ddd0f4509233099a3ad96fd4318c07
