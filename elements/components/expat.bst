kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  command-subdir: expat
  cmake-local: >-
    -DEXPAT_BUILD_EXAMPLES=OFF
    -DEXPAT_BUILD_TESTS=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libexpat.so'

sources:
- kind: git_repo
  url: github:libexpat/libexpat.git
  track: R_*
  ref: R_2_8_1-0-gc7ffbf3879f6aef7a7b020ef84ddb4ee00222b19
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
