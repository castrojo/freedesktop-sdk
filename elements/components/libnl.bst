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
  ref: libnl3_9_0-0-gbdf83151326e365f137fe0e36dc9b1b7aeb1cf33
