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
  ref: 0.60-0-g78d68d7dc34c6fd387703d7d20d3cf0e0db0a7ce
