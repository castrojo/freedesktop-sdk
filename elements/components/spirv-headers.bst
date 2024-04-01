kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:KhronosGroup/SPIRV-Headers.git
  ref: sdk-1.3.216.0-0-gb2a156e1c0434bc8c99aaebba1c7be98be7ac580
