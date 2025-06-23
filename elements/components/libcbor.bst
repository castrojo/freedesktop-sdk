kind: cmake-recc

build-depends:
- public-stacks/buildsystem-cmake.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

variables:
  cmake-local: >-
    -DBUILD_SHARED_LIBS:BOOL=ON

config:
  install-commands:
    (>):
    - find %{install-root} -name '*.o' -delete

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libcbor.so'

sources:
- kind: git_repo
  url: github:PJK/libcbor.git
  track: v*
  ref: v0.13.0-0-g9826a4315116a588f7416912db9da6fcecd8da11
