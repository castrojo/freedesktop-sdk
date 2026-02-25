kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- bootstrap-import.bst
- components/nettle.bst

sources:
- kind: git_repo
  url: github:pauldreik/rdfind.git
  track: "*.*.*"
  ref: releases/1.8.0-0-g994638b1ca7813d633fc749136605a9d38728b59
