kind: cmake

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst
- components/python3.bst

public:
  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_14_0-0-gcbe58f6237b2238c9af7f51c6b7afb8bbf52c866
