kind: cmake

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/flex.bst
- components/bison.bst

sources:
- kind: git_tag
  url: github:doxygen/doxygen.git
  track: master
  ref: Release_1_9_7-0-g6a2ce4d18b5af1ca501bcf585e4c8e2b2b353b0f
