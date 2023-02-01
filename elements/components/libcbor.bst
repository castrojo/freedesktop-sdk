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
  ref: v0.10.2-0-gefa6c0886bae46bdaef9b679f61f4b9d8bc296ae
