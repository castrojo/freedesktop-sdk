kind: autotools

depends:
- bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libnl.so'

sources:
- kind: git_repo
  url: github:thom311/libnl.git
  track: libnl*
  ref: libnl3_8_0-0-g6b2533c02813ce21b27ea8318fbe1af95652a39e
