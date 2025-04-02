kind: cmake

depends:
- public-stacks/runtime-minimal.bst
- filename: public-stacks/buildsystem-cmake.bst
  type: build

variables:
  cmake-local: >-
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
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
  ref: v1.3.5-0-ge1774cd77f471443541596e09078e78fdc342e4f
