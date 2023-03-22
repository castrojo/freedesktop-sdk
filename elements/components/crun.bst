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
  ref: 1.8.2-0-gbf70c97995109417ac0c5ed0a758d82662456724
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 23aed835eed8d81d124977583551a81abe595a0c
- kind: git_module
  path: runtime-spec
  url: github:opencontainers/runtime-spec.git
  directory: libocispec
  ref: 494a5a6aca782455c0fbfc35af8e12f04e98a55e
- kind: git_module
  path: image-spec
  url: github:opencontainers/image-spec.git
  directory: libocispec
  ref: bc9c4bd9b2a4ec6f49f956e193f9c699d854507d
- kind: git_module
  path: yajl
  url: github:containers/yajl.git
  directory: libocispec
  ref: 49923ccb2143e36850bcdeb781e2bcdf5ce22f15
