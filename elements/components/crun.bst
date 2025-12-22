kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst
- components/git-minimal.bst
- components/gperf.bst

depends:
- components/systemd-libs.bst
- components/libcap.bst
- components/libseccomp.bst
- public-stacks/runtime-minimal.bst

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
  ref: 1.26-0-g3241e671f92c33b0c003cd7de319e4f32add6231
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: bf749566cda632fb2f5dcf9c4eb5bbec71ac7d5f
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: d64c1d945da7cf6970061c7c9ff4391fafdf2a15
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 26647a49f642c7d22a1cd3aa0a48e4650a542269
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 6bc5219389fd2752631682b0a8368e6d8218a8c5
