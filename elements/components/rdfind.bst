kind: autotools

build-depends:
- public-stacks/buildsystem-autotools.bst
- (@): include/_private/gcc-for-recc.yml

depends:
- public-stacks/runtime-minimal.bst
- components/nettle.bst

variables:
  local_flags: -std=c++17

sources:
- kind: git_repo
  url: github:pauldreik/rdfind.git
  track: "*.*.*"
  ref: releases/1.8.0-0-g994638b1ca7813d633fc749136605a9d38728b59
