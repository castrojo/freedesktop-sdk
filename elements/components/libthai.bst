kind: autotools

build-depends:
- components/git-minimal.bst
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/libdatrie.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libthai.so'

sources:
- kind: git_repo
  url: github:tlwg/libthai.git
  track: v*
  ref: v0.1.29-0-g618e442c340cff089f29743d35392a6aba21a9fb
