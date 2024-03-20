kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst

depends:
- components/buildbox-common.bst

runtime-depends:
- components/bubblewrap.bst

variables:
  cmake-local: >-
    -DBUILD_TESTING=OFF
  (?):
  - target_arch == "riscv64":
      local_ldflags: "-Wl,--push-state,--no-as-needed -latomic -Wl,--pop-state"

config:
  install-commands:
    (>):
    - ln -s buildbox-run-bubblewrap "%{install-root}%{bindir}/buildbox-run"

sources:
- kind: git_repo
  url: gitlab:BuildGrid/buildbox/buildbox-run-bubblewrap.git
  track: '*.*.*'
  ref: 1.0.1-0-g86a0d9847724dcf3c0afa23163882db484ef6bd0
