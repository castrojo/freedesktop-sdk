kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libabsl_*.so'


sources:
- kind: git_repo
  url: github:abseil/abseil-cpp.git
  track: '[0-9]*.[0-9]'
  ref: 20240722.0-0-g4447c7562e3bc702ade25105912dce503f0c4010
- kind: patch
  path: patches/abseil-cpp/avoid-export-of-testonly-target-in-cmake.patch
