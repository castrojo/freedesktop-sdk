kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/ninja.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfmt.so'

sources:
- kind: git_repo
  url: github:fmtlib/fmt.git
  track: '*.*.*'
  ref: 11.2.0-0-g40626af88bd7df9a5fb80be7b25ac85b122d6c21
