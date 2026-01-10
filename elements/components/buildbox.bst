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
  ref: 1.3.50-0-gbb6c5f36177211e507abd9de1dfe3d8a7e2529fc
