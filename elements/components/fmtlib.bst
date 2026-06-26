kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
        - '%{libdir}/libfmt-c.so'
        - '%{libdir}/libfmt.so'

sources:
- kind: git_repo
  url: github:fmtlib/fmt.git
  track: '*.*.*'
  ref: 12.2.0-0-g1be298e1bd68957e4cd352e1f676f00e07dcfb57
- kind: patch
  path: patches/fmtlib/0001-Fix-fallback-uint128-bitwise-not-4813.patch
- kind: patch
  path: patches/fmtlib/0002-Turn-libfmt-c-into-a-shared-library-4812.patch
