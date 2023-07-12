kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/buildbox-common.bst
- components/fuse3.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox-fuse.git
  track: '*.*.*'
  ref: 1.0.1-0-g3b9d7b99cbaef63c6a94c094a5dca4e922c0c901
