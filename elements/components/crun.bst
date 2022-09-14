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
- kind: git_tag
  url: github:containers/crun.git
  track: main
  ref: 1.6-0-g18cf2efbb8feb2b2f20e316520e0fd0b6c41ef4d
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: cd78b375dd19464a5c7f118cd0f86082e7424255
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 72c1f0b44f7976960febe9e48e36c88d12ec9b72
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: 7b36cea86235157d78528944cb94c3323ee0905c
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 49923ccb2143e36850bcdeb781e2bcdf5ce22f15
