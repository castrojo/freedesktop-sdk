kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:json-c/json-c.git
  track: json-c-*
  ref: json-c-0.17-20230812-0-gb4c371fa0cbc4dcbaccc359ce9e957a22988fb34
