kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

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
  ref: v1.30-0-g52e071dbb1b6886471bf2c90eab95de89c5b3e0d
