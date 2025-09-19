kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/ninja.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS=OFF

sources:
- kind: git_repo
  url: github:fmtlib/fmt.git
  track: '*.*.*'
  ref: 12.0.0-0-ge424e3f2e607da02742f73db84873b8084fc714c
