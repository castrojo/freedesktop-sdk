kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: gitlab:cunity/cunit.git
  track: '*.*.*'
  ref: 3.2.7-0-gfb8a818f4fd7409762389e850f93118c822d2c6e
