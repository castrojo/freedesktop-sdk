kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst

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
  ref: v3.0.2-0-gefc905a7c2ed155b3654d7968173622734eeb0c0
