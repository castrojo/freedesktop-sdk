kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/git-minimal.bst

depends:
- components/buildbox-common.bst
- components/openssl.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

sources:
- kind: git_repo
  url: gitlab:BuildGrid/recc.git
  track: '*.*.*'
  ref: 1.1.1-0-g72e99108ff9dc13503770005811f80e57ac8a8fb
