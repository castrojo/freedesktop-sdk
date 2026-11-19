# SPDX-FileCopyrightText: Freedesktop-SDK Developers
# SPDX-License-Identifier: MIT

kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst

depends:
- components/bubblewrap.bst
- components/curl.bst
- components/fuse3.bst
- components/grpc.bst
- components/openssl.bst
- components/protobuf.bst
- components/tomlplusplus.bst
# Uses libuuid only
- components/util-linux-libs.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DCASD=ON
    -DCASD_BUILD_BENCHMARK=OFF
    -DOCI=OFF
    -DCAS_HTTP=ON
    -DRUN_USERCHROOT=OFF
    -DRUN_OCI=OFF
    -DCASD_WRAP=OFF
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox.git
  track: '*.*.*'
  ref: 1.4.32-0-g7273feb571ea03f0cd9ac4f45799e7b91e210ede
