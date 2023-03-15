kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Headers.git
  track: sdk-*
  ref: sdk-1.3.239.0-0-gd13b52222c39a7e9a401b44646f0ca3a640fbd47
