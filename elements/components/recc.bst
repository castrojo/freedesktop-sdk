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
  ref: 1.1.2-0-gc11e660d372d706103dab304aa79728fe6eb7486
