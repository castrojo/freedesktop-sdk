kind: cmake

depends:
- public-stacks/runtime-minimal.bst

build-depends:
- public-stacks/buildsystem-cmake.bst

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -DDOCTEST_WITH_TESTS=OFF

sources:
- kind: git_repo
  url: github:doctest/doctest.git
  track: v*
  ref: v2.4.12-0-g1da23a3e8119ec5cce4f9388e91b065e20bf06f5
