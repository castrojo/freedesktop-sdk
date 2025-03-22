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

sources:
- kind: git_repo
  url: github:PJK/libcbor.git
  track: v*
  ref: v0.12.0-0-gae000f44e8d2a69e1f72a738f7c0b6b4b7cc4fbf
