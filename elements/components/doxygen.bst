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
  ref: Release_1_17_0-0-g65a43c0aba45cc23b3ca11b6b5334d4eea931726
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
