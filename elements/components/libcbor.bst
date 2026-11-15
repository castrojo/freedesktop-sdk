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
  ref: v0.14.1-0-g4218162778124ab87b108bac3456aecd6d9d1938
