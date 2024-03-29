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
  ref: 0.64-0-gd8eaabc0c346a93543ba51f9ee6d5e8dd37ac5de
