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
  ref: Release_1_16_0-0-gbc2ac3e0376b94ce08f4dd2decfe9dfb2fc5e1dc
