kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:KhronosGroup/SPIRV-Headers.git
  track: sdk-*
  ref: sdk-1.3.246.1-0-g1feaf4414eb2b353764d01d88f8aa4bcc67b60db
