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
  ref: Release_1_9_5-0-g2f6875a5ca481a69a6f32650c77a667f87d25e88
