kind: cmake

build-depends:
- components/_private/cmake-stage1.bst
- components/gcc.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: expat

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

sources:
- kind: git_repo
  url: github:libexpat/libexpat.git
  track: R_*
  ref: R_2_7_4-0-gf5c2890d8ff91f88a018173d293a9bd02f76389e
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
