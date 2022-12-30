kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.10.0-0-g997b87749ce8bfeda496685c0f0e6025dc85791f
