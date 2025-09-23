kind: cmake

build-depends:
- components/bison.bst
- components/cmake-vendored.bst
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
  ref: Release_1_14_0-0-gcbe58f6237b2238c9af7f51c6b7afb8bbf52c866
