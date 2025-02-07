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
  ref: 1.20-0-g9c9a76ac11994701dd666c4f0b869ceffb599a66
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 5ffd4dd9fa684e0ffb2f0b5ea4a6cb638b021397
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 9505701eb390445ef7edf2be3bd3d7bc1f14eae5
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: c66e8113cbad252a418d85f061bd1a20d0904d08
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 6bc5219389fd2752631682b0a8368e6d8218a8c5
