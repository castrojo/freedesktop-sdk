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
  ref: 0.57-0-g104d49638e3668bcc2935099a59f2ab2caf6b27f
