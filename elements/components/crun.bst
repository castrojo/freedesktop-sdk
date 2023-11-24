kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/python3.bst
- components/git-minimal.bst
- components/gperf.bst

depends:
- components/yajl.bst
- components/systemd-libs.bst
- components/libcap.bst
- components/libseccomp.bst
- bootstrap-import.bst

environment:
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      MAKEFLAGS: "-j1"

sources:
- kind: git_repo
  url: github:containers/crun.git
  track: '*.*'
  ref: 1.12-0-gce429cb2e277d001c2179df1ac66a470f00802ae
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 19c05670c37a42c217caa7b141bcaada7867cc15
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 55ae2744e3a034668fa2c40687251095a69ed63e
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 0b40f0f367c396cc5a7d6a2e8c8842271d3d3844
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 49923ccb2143e36850bcdeb781e2bcdf5ce22f15
