kind: cmake

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst
- components/python3.bst

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_9_8-0-gc2fe5c3e4986974eb2a97608b24086683502f07f
