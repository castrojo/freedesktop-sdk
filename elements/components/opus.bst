kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst

depends:
- bootstrap-import.bst

variables:
  arch-conf: ''
  (?):
  - target_arch in ["x86_64", "aarch64", "i686"]:
      arch-conf: -DOPUS_DISABLE_INTRINSICS=OFF
  - target_arch == "ppc64le":
      arch-conf: -DOPUS_DISABLE_INTRINSICS=ON

  cmake-local: >-
    -DBUILD_SHARED_LIBS=ON
    -DBUILD_TESTING=OFF
    -DOPUS_DNN=OFF
    -DOPUS_DEEP_PLC=OFF
    -DOPUS_DRED=OFF
    -DOPUS_OSCE=OFF
    -DOPUS_CUSTOM_MODES=ON
    %{arch-conf}

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libopus.so'
  cpe:
    vendor: opus-codec

sources:
- kind: git_repo
  url: xiph:opus.git
  track: v*
  ref: v1.5.2-0-gddbe48383984d56acd9e1ab6a090c54ca6b735a6
