kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

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
  ref: v0.11.0-0-g170bee2b82cdb7b2ed25af301f62cb6efdd40ec1
