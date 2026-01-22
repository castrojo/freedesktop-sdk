kind: autotools
description: GNU less

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  # https://github.com/gwsw/less/blob/v661-rel/README#L35
  autogen: make -f Makefile.aut distfiles

public:
  cpe:
    vendor: 'gnu'
    version-match: '\d+'

sources:
- kind: git_repo
  url: github:gwsw/less.git
  track: v*-rel
  ref: v691-rel-0-gac365da87548deff920cb9ecc286de161c8e8a54
