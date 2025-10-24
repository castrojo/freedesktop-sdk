kind: cmake

build-depends:
- components/bison.bst
- components/_private/cmake-vendored.bst
- components/flex.bst
- components/gcc.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst
- components/python3.bst
- components/stripper.bst

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
