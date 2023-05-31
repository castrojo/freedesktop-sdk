kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Headers.git
  track: sdk-*
  ref: sdk-1.3.250.0-0-g268a061764ee69f09a477a695bf6a11ffe311b8d
