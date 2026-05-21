kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_SKIP_INSTALL_RPATH=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libabsl_*.so'

sources:
- kind: git_repo
  url: github:abseil/abseil-cpp.git
  track: '20240722.[0-9]'
  ref: 20240722.2-0-g216a6bed75c9ec254ae0e5af537e5b9635b45191
