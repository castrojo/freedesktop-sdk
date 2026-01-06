kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_16_0-0-g0128237a63c2ca9ca4c8d772d0cee9e8e5415835
