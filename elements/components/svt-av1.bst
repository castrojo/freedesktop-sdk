kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DREPRODUCIBLE_BUILDS=1

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
  ref: v2.1.2-0-gc949fe4f14fe288a9b2b47aa3e61335422a83645
