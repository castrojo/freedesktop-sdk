kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:json-c/json-c.git
  ref: json-c-0.16-20220414-0-g2f2ddc1f2dbca56c874e8f9c31b5b963202d80e7
