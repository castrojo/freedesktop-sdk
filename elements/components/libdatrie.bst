kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: components/git-minimal.bst
  type: build
- filename: public-stacks/buildsystem-autotools.bst
  type: build

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
  ref: v0.2.13-0-ge697a665f3590af9dc2d5d8b4f714c5e4a5f7fbd
