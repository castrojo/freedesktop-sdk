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

sources:
- kind: git_repo
  url: github:doxygen/doxygen.git
  track: Release_*
  ref: Release_1_16_1-0-g669aeeefca743c148e2d935b3d3c69535c7491e6
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
