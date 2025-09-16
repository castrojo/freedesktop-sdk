kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/systemd.bst
- components/python3.bst
- components/git-minimal.bst
- components/gperf.bst

depends:
- components/systemd-libs.bst
- components/libcap.bst
- components/libseccomp.bst
- bootstrap-import.bst

variables:
  conf-local: >-
    --enable-embedded-yajl
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      notparallel: true

sources:
- kind: git_repo
  url: github:containers/crun.git
  track: '*.*'
  ref: 1.24-0-g54693209039e5e04cbe3c8b1cd5fe2301219f0a1
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 552ccbbad3aaff8e07e8fbad210ec3b4c9c95a66
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: e3c8d12d94cdd269a145a263ace7457f56c74eff
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 2daaaaf0e7c16a6a147be91fde277f38573be672
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 6bc5219389fd2752631682b0a8368e6d8218a8c5
