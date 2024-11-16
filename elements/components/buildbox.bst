kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst

depends:
- components/bubblewrap.bst
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
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox.git
  track: '*.*.*'
  ref: 1.2.33-0-gd05e3d57d122c7f2d0bd9b7e175c36f9535198bc

