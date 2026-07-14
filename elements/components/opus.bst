# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v1.6.1-0-g22244de5a79bd1d6d623c32e72bf1954b56235be
