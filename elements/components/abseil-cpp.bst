kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

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
  track: '[0-9]*.[0-9]'
  ref: 20250127.0-0-g9ac7062b1860d895fb5a8cbf58c3e9ef8f674b5f
