kind: autotools

depends:
- public-stacks/runtime-minimal.bst
- filename: components/libogg.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --enable-cpplibs \
    --enable-ogg

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libFLAC.so'
        - '%{libdir}/libFLAC++.so'

sources:
- kind: git_repo
  url: xiph:flac.git
  track: '*.*.*'
  ref: 1.5.0-0-g1507800de4b70e21be71f38caa0d9079d0bc6e45
