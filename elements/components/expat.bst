kind: cmake

build-depends:
- components/cmake-stage1.bst
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

  cpe:
    version-match: '(\d+)_(\d+)_(\d+)'

sources:
- kind: git_repo
  url: github:libexpat/libexpat.git
  track: R_*
  ref: R_2_7_2-0-g7643f96bd5b9f5d3b26ea112519e05e17ef91cfb
