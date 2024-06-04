kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

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
  ref: 1.2.0-0-g457c891775a7397bdb0376bb1031e6e027af1c48
