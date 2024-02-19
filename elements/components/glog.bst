kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:google/glog.git
  track: v*
  exclude:
  - '*rc*'
  ref: v0.7.0-0-g34b8da6496aec6a98277808701cfa834fae9801f
