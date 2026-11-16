kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS:BOOL=ON

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.o' -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcbor.so'

sources:
- kind: git_repo
  url: github:PJK/libcbor.git
  track: v*
  ref: v0.15.0-0-gcf5bd4bd293ce730b9455fa9cd822166c3dc4599
