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
  ref: 11.1.1-0-ge3ddede6c4ee818825c4e5a6dfa1d384860c27d9
