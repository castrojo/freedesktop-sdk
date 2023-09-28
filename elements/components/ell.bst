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
- kind: git_tag
  url: kernel:libs/ell/ell.git
  track: master
  ref: 0.59-0-g0e8f533ed045af0008c36ee3fa1cf6376497234c
