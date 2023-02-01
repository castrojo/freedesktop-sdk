kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.10.2-0-gefa6c0886bae46bdaef9b679f61f4b9d8bc296ae
