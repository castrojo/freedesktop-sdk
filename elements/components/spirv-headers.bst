kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  track: master
  match:
  - sdk-*
  ref: sdk-1.3.236.0-0-g1d31a100405cf8783ca7a31e31cdd727c9fc54c3
