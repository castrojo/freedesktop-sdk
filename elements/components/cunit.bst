kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: gitlab:cunity/cunit.git
  track: '*.*.*'
  ref: 3.4.3-0-gab1c558dcd452983a67903fb4bde1dfbedab86ea
