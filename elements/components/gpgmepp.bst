kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst
- components/gpgme.bst
- components/libassuan.bst
- components/libgpg-error.bst

variables:
  cmake-local: >-
    -DENABLE_SHARED=ON
    -DBUILD_TESTING=OFF

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libgpgmepp.so'

sources:
- kind: git_repo
  url: gnupg:gpgmepp.git
  track: gpgmepp-*
  exclude:
  - "*-base"
  ref: gpgmepp-2.0.0-0-g301d39f8b97a79369292280e201e45f472d71e91
