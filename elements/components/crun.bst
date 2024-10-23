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
  ref: 1.18-0-g8656b2548509fcc69ea7e8823a870564360a57a1
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 68211ccc41201c45ad276b04c7f67d61e80b1f7a
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: cb7ae92f1f5c64a38f67387af2e636e93c8af15e
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: f5f87016de46439ccf91b5381cf76faaae2bc28f
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 6bc5219389fd2752631682b0a8368e6d8218a8c5
