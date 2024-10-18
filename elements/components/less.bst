kind: autotools
description: GNU less

depends:
- filename: bootstrap-import.bst

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

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
  ref: v668-rel-0-ge77e1176c80cca989694818866ae6cd7e7707161
- kind: patch
  path: patches/less/less-reproducible.patch
