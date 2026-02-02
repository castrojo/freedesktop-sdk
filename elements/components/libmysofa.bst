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
  ref: v1.3.4-0-g7a0c07111a3d7230ec534e08925c24a7525f33c0
