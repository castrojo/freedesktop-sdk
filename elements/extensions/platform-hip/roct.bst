kind: cmake

build-depends:
- public-stacks/buildsystem-cmake.bst
- components/numactl.bst
- extensions/platform-hip/libdrm.bst

sources:
- kind: git_repo
  url: github:ROCm/ROCT-Thunk-Interface.git
  track: rocm-*
  ref: rocm-6.2.0-0-gc8db22210d64ce6bea6177434c9408e684d6a74d
