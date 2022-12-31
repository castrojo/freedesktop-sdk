kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_tag
  url: github:PJK/libcbor.git
  track: master
  ref: v0.10.1-0-g5c1bb892c94b6ae2ef99e3c6673d5e0857242f38
