kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst
- components/nlohmann-json.bst

depends:
- components/bubblewrap.bst
- components/curl.bst
- components/fuse3.bst
- components/glog.bst
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

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox.git
  track: '*.*.*'
  ref: 1.4.5-0-gadb0bf054d0ca53b04c79330e497d18e2a79a2df
