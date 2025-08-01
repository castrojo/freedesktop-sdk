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
  ref: 1.23.1-0-gd20b23dba05e822b93b82f2f34fd5dada433e0c2
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 68397329bc51a66c56938fc4111fac751d6fd3b0
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: d2f4f9097a834934fd8232cfc54ddc3679a44764
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 64294bd7a2bf2537e1a6a34d687caae70300b0c4
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 6bc5219389fd2752631682b0a8368e6d8218a8c5
