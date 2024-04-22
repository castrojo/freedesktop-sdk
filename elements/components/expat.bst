kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
  ref: R_2_6_2-0-gfa75b96546c069d17b8f80d91e0f4ef0cde3790d
