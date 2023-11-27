kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libell.so'

sources:
- kind: git_repo
  url: kernel:libs/ell/ell.git
  track: '*.*'
  ref: 0.61-0-gc1d27bd75fa0a2b94a35dd7990b23b6c110f49a4
