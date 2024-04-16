kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/glog.bst
- components/grpc.bst
- components/protobuf.bst
- components/util-linux.bst
- components/tomlplusplus.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox-common.git
  track: '*.*.*'
  ref: 1.0.16-0-g6d49384ccd11f93a9c30aae179c81d8591beed83
