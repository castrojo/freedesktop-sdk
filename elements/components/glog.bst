kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:google/glog.git
  track: v*
  exclude:
  - '*rc*'
  ref: v0.7.1-0-g7b134a5c82c0c0b5698bb6bf7a835b230c5638e4
