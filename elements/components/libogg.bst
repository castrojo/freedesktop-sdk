kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS:BOOL=ON

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libogg.so'

sources:
- kind: git_repo
  url: github:xiph/ogg.git
  track: v*
  ref: v1.3.6-0-gbe05b13e98b048f0b5a0f5fa8ce514d56db5f822
