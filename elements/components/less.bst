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
  ref: v685-rel-0-gbcfda5f4ff0a1cc58aeb9eadcf2b6f1659523d45
