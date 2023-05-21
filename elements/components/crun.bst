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

variables:
  builddir: ''

environment:
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      MAKEFLAGS: "-j1"

sources:
- kind: git_tag
  url: github:containers/crun.git
  track: main
  ref: 1.8.5-0-gb6f80f766c9a89eb7b1440c0a70ab287434b17ed
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: c25972b4111d9c90ab7757aefdbc8186608c4ff3
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 0983f1d9e08f6da82b921da9cf2a047b0463976a
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: d86384efdb8c30770a92415c100f57a9bffbb64e
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 49923ccb2143e36850bcdeb781e2bcdf5ce22f15
