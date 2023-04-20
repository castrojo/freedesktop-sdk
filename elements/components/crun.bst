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
  ref: 1.8.4-0-g5a8fa99a5e41facba2eda4af12fa26313918805b
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 4c2abee1b08090eb4383fde4a2321a114168c0b7
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 05ff261895cf36bfd9fa84a180c80d91f3cbc8ee
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: dd7fd714f5406d39db5fd0602a0e6090929dc85e
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 49923ccb2143e36850bcdeb781e2bcdf5ce22f15
