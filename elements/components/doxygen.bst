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
  ref: Release_1_15_0-0-g7cca38ba5185457e6d9495bf963d4cdeacebc25a
