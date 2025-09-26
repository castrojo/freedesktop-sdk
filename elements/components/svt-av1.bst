kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/nasm.bst

depends:
- bootstrap-import.bst

variables:
  cmake-local: >-
    -DREPRODUCIBLE_BUILDS=1
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF

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
  track: v2.2.*
  exclude:
  - "*rc*"
  ref: v2.2.1-0-g55a01def732bb9e7016d23cc512384f7a88d6e86
