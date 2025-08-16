kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhwy.so'
        - '%{libdir}/libhwy_contrib.so'
        - '%{libdir}/libhwy_test.so'

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF

sources:
- kind: git_repo
  url: github:google/highway.git
  track: '*.*.*'
  ref: 1.3.0-0-gac0d5d297b13ab1b89f48484fc7911082d76a93f
