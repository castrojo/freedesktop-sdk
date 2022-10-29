kind: autotools

depends:
- filename: bootstrap-import.bst
- filename: public-stacks/buildsystem-autotools.bst
  type: build

variables:
  conf-local: |
    --with-readline \
    --with-ui

public:
  bst:
    split-rules:
      devel:
        (>):
        - '%{libdir}/libhunspell-1.7.so'

sources:
- kind: git_tag
  url: github:hunspell/hunspell.git
  track: master
  ref: v1.7.1-0-g1180421f50f211984211e968eb6801ffd3390b8f
