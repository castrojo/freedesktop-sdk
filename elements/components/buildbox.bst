kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/_private/git-minimal.bst

depends:
- components/bubblewrap.bst
- components/fuse3.bst
- components/grpc.bst
- components/openssl.bst
- components/protobuf.bst
- components/tomlplusplus.bst
- components/util-linux.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
    -DTOOLS=OFF
    -DCASD=ON
    -DCASD_BUILD_BENCHMARK=OFF
    -DFUSE=ON
    -DRECC=ON
    -DRUN_BUBBLEWRAP=ON
    -DWORKER=ON
    -DTREXE=ON
    -DRUN_HOSTTOOLS=ON
    -DCMAKE_DISABLE_PRECOMPILE_HEADERS=ON
    -DOCI=OFF

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox.git
  track: '*.*.*'
  ref: 1.4.1-0-g5f0255032fa461795cbe1db46c3fa74c9beb12ec
