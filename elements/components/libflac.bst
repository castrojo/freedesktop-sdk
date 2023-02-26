kind: autotools

depends:
- filename: bootstrap-import.bst
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
  ref: 1.4.1-0-gb6fbd6b3d97e2da4481bdbd25176f263fd6a5e75
