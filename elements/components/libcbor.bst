kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DBUILD_SHARED_LIBS:BOOL=ON

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.o' -delete

sources:
- kind: git_repo
  url: github:PJK/libcbor.git
  track: v*
  ref: v0.13.0-0-g9826a4315116a588f7416912db9da6fcecd8da11
