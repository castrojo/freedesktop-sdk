kind: autotools-recc

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/_private/git-minimal.bst
- components/doxygen.bst
- filename: components/gcc.bst
  config:
    digest-environment: RECC_REMOTE_PLATFORM_chrootRootDigest

depends:
- public-stacks/runtime-minimal.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libdatrie.so'

sources:
- kind: git_repo
  url: github:tlwg/libdatrie.git
  track: v*
  ref: v0.2.14-0-g45e981da7cd1d448663d901f2c1e180401ce09f1
