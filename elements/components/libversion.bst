kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- bootstrap-import.bst

sources:
- kind: git_repo
  url: github:repology/libversion.git
  track: '*.*.*'
  ref: 3.0.3-0-gf851fec7d976820061952f6d90d3b60f2bae774b
