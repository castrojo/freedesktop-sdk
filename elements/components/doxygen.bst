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
  ref: Release_1_18_0-0-g8e760943e5d9581a444cf327f43a0b4d20d29482
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
