kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:c-ares/c-ares.git
  track: cares-*
  ref: cares-1_20_1-0-ge8fe27eaa841ed32a4f82bef7a72c4e04e7f86a7
