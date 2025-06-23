kind: cmake

build-depends:
- components/_private/buildsystem-cmake.bst
- components/_private/recc.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

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
  ref: R_2_7_5-0-gf31adfd584b7f6c50bbf4d22eb928538ffc9145a
  version-guess-pattern: '(\d+)_(\d+)_(\d+)'
