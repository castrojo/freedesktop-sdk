kind: autotools
description: GNU less

build-depends:
- public-stacks/buildsystem-autotools.bst
- components/groff.bst

depends:
- bootstrap/ncurses.bst
- public-stacks/runtime-minimal.bst

variables:
  # https://github.com/gwsw/less/blob/v661-rel/README#L35
  autogen: make -f Makefile.aut distfiles

public:
  cpe:
    vendor: 'gnu'

sources:
- kind: git_repo
  url: github:gwsw/less.git
  track: v*-rel
  ref: v702-rel-0-gfc7dafdbdfd1c26ed839d77f13428419cccd44fe
  version-guess-pattern: '\d+'
