kind: cmake

(@):
- include/_private/cmake-recc.yml

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DREPRODUCIBLE_BUILDS=1
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DUSE_CPUINFO=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - "%{libdir}/libSvtAv1Dec.so"
        - "%{libdir}/libSvtAv1Enc.so"

sources:
- kind: git_repo
  url: git_https:gitlab.com/AOMediaCodec/SVT-AV1
  track: v*.*.*
  exclude:
  - "*rc*"
  ref: v4.0.1-0-g4ae9272b588a05ee6e77a43e8dfdac05f54c4ff0
