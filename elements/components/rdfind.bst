kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst

depends:
- public-stacks/runtime-minimal.bst
- components/nettle.bst

sources:
- kind: git_repo
  url: github:pauldreik/rdfind.git
  track: "*.*.*"
  ref: releases/1.7.0-0-g594553e9c074d8ffa136ef95d6617a3199cea918
