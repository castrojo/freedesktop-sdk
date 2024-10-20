kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/cunit.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:hoene/libmysofa.git
  track: "v*"
  ref: v1.3.3-0-g444d2c1d7ececf5cc2d96d3b17b209047b02318d
