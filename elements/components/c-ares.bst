kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:c-ares/c-ares.git
  track: cares-*
  ref: cares-1_19_1-0-g6360e96b5cf8e5980c887ce58ef727e53d77243a
