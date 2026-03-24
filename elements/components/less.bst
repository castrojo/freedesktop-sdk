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
  ref: v692-rel-0-gdc60d93e8179099f77a275583206d4707fcbca3f
  version-guess-pattern: '\d+'
