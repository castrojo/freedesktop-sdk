kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gitlab:cunity/cunit.git
  track: '*.*.*'
  ref: 3.5.5-0-ge3dbdef12ee4260d103e2a8591ead52e70e1f0a9
