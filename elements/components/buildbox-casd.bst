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
    -DBUILD_BENCHMARK=OFF
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

public:
  bst:
    integration-commands:
    - buildbox-casd --version ""

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox-casd.git
  track: '*.*.*'
  ref: 1.0.3-0-g05852c06a5b38fed16ed99c081d7b9cca6208e07
