kind: filter

build-depends:
- components/flex-base.bst

runtime-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst

config:
  include:
  - libfl
