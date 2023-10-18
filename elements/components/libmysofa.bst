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
  ref: v1.3.2-0-g33974839677da7044ef5a70be7ad5550735aae6e
