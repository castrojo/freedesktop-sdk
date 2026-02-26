kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- public-stacks/runtime-minimal.bst
- components/libyaml.bst

variables:
  arch-conf: ''
  (?):
  - target_arch == "i686":
      arch-conf: >-
        -DENABLE_PORTABLE_TARGET=ON

  cmake-local: >-
    -DENABLE_NETWORK=OFF
    -DBUILD_TESTING=OFF
    -DENABLE_LIBCLANG=OFF
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libfyaml.so'

sources:
- kind: git_repo
  url: github:pantoniou/libfyaml.git
  track: v*
  ref: v0.9.5-0-gcee236b62d9f7a1e59d7a9042f231c9946d2a8c3
