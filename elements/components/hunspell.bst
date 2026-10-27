kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst

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
  ref: v1.7.6-0-g15faca15532b34db3106d50f162e5edc2503d6d6
