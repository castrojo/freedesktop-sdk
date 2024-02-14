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
  ref: 0.62-0-g26e4465f538b98693bbf88e3a7d0aea31c28e53f
