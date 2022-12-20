kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/cunit.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:hoene/libmysofa.git
  track: main
  ref: v1.3.1-0-g3002ea258686ae1129f042644a3c2a87860b7d31
