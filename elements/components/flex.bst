kind: filter

build-depends:
- components/flex-base.bst

runtime-depends:
- bootstrap/bash.bst
- bootstrap/coreutils.bst
- bootstrap/glibc.bst
- bootstrap/symlinks.bst
- components/utf-locale.bst
- components/m4.bst
- components/libfl.bst

config:
  exclude:
  - libfl
