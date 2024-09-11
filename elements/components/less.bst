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
  ref: v661-rel-0-g55fa179597ceea96bb490817f9160ab29a8e4f11
