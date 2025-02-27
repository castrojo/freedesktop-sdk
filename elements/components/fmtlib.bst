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
  ref: 11.1.4-0-g123913715afeb8a437e6388b4473fcc4753e1c9a
