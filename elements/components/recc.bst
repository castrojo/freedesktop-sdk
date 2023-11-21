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
  ref: 1.0.5-0-gd5b2f882ef8073d2ef0a55de92793a3eb7ad7439
