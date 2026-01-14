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
  ref: v0.9.3-0-g433d75fabd2b746e11c01d66348549625653e961
