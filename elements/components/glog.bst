kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:google/glog.git
  track: v*
  ref: v0.6.0-0-gb33e3bad4c46c8a6345525fd822af355e5ef9446
