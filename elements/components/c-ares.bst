kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:c-ares/c-ares.git
  track: cares-*
  ref: cares-1_19_0-0-gfddf01938d3789e06cc1c3774e4cd0c7d2a89976
