kind: cmake

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_13_0-0-g3fc9e7f98b8d1156ec627cd3ee6f23984bf4e1b1
