kind: cmake

build-depends:
- components/cmake-stage1.bst
- components/gettext.bst
- components/ninja.bst
- components/pkg-config.bst

depends:
- bootstrap-import.bst

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
  ref: R_2_6_3-0-g88b3ed553d8ad335559254863a33360d55b9f1d6
