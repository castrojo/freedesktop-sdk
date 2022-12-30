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
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.9.0-0-g58b3319b8c3ec15171cb00f01a3a1e9d400899e1
