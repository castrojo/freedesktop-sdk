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
  ref: v1.3.5-0-g6cc5b15a73e9bd97810d03767082edda7f315881
