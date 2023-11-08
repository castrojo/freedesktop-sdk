kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/glog.bst
- components/grpc.bst
- components/protobuf.bst
- components/util-linux.bst


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
  ref: 1.0.5-0-g94014c4eac867b506ebf1c019078a0208c8a484b
# https://gitlab.com/BuildGrid/buildbox/buildbox-common/-/merge_requests/505
- kind: patch
  path: patches/buildbox-common/0002-Tell-CMake-to-find-Protobuf-in-Config-mode.patch
