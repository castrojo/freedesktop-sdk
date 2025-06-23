kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

sources:
- kind: git_repo
  url: github:repology/libversion.git
  track: '*.*.*'
  ref: 3.0.4-0-g0c2c247a6c7ed562e6bc85f02cc4709621226c33
