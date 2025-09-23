kind: cmake

description: |
    CMake built with vendored dependencies only. This is ONLY supposed
    to be used a build dependency to resolve circular dependency
    chains. This is NOT supposed to be staged together
    with `components/cmake.bst` and NOT supposed to be shipped
    anywhere.

(@):
- elements/include/cmake-source.yml

build-depends:
- components/cmake-stage1.bst
- components/gcc.bst
- components/ninja.bst
- components/stripper.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  license-element-name: cmake
