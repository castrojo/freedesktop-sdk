kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/bison.bst
- components/flex.bst
- components/python3.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_17_0-0-gd4a2c26451e537aa321f10d2483c67fc227eaf9e
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
