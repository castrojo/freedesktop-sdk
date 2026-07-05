kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:json-c/json-c.git
  track: json-c-*
  ref: json-c-0.19-20260627-0-gaa716cd8d663c976b99b0f30f102ee1d8ef63146
