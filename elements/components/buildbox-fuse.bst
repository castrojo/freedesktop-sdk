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
  ref: 1.0.2-0-g90b80e4ed48e624059b9922dc4018b43dc7f3e7e
