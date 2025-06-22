kind: autotools
build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: libnl3_11_0-0-gc7edc38f8e335c18c5e17451d2cb19b9b8d0b48f
