kind: autotools

(@):
- include/_private/autotools-recc.yml

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/bison.bst
- components/flex.bst
- (@): include/_private/gcc-for-recc.yml

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
  ref: libnl3_12_0-0-g43878680c994989f16637dc47be19bb8dc154985
