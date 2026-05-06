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
- kind: git_repo
  url: github:hunspell/hunspell.git
  track: v*
  ref: v1.7.3-0-gc5f98152a274e25b5107101104bef632b83a0cc9
