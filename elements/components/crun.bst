kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/python3.bst
- components/_private/git-minimal.bst
- components/gperf.bst

depends:
- components/json-c.bst
- components/libcap.bst
- components/libseccomp.bst
- components/systemd-libs.bst
- public-stacks/runtime-minimal.bst

variables:
  (?):
  - target_arch == "riscv64":
      # incredibly racy on riscv64
      notparallel: true

sources:
- kind: git_repo
  url: github:containers/crun.git
  track: '*.*'
  ref: 1.28-0-g54f16ffbefcd022bf032af768b5c5ce075c18bfc
- kind: git_module
  path: libocispec
  url: github:containers/libocispec.git
  ref: 8034d0ecd27f646ba3ffae5ff24db234ce062825
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
# backport of https://github.com/containers/crun/pull/2102
- kind: patch
  path: patches/crun/0001-build-export-json_gen_-symbols.patch
