kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst
- components/elfutils.bst
- components/libbpf.bst
- components/zlib.bst

variables:
  cmake-local: >-
    -DLIBBPF_EMBEDDED=false

sources:
- kind: git_repo
  url: kernel:devel/pahole/pahole.git
  track: 'v*'
  ref: v1.31-0-g1f2805b6eef104df3125143c949b391f6122e5b9
