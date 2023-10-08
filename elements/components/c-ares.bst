kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:c-ares/c-ares.git
  track: cares-*
  ref: cares-1_20_0-0-gbfe84bf251020efdabe15730f6377a66e2d79ff7
