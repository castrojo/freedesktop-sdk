kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: gitlab:cunity/cunit.git
  track: '*.*.*'
  ref: 3.5.2-0-g002134c7487e7c56a986d87c7d63c861a52f3ad2
