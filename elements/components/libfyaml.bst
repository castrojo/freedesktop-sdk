# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

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
  exclude:
  - "*alpha*"
  ref: v1.0.0-beta1-0-g87ea43acbcbdec799ca7c433a4d9860a0b578285
- kind: patch
  path: patches/libfyaml/i686-build-fix.patch
