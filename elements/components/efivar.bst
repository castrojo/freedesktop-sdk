kind: make

build-depends:
- public-stacks/buildsystem-make.bst
- components/mandoc.bst

depends:
- public-stacks/runtime-minimal.bst
- components/openssl.bst

variables:
  make-args: >-
    PREFIX='%{prefix}'
    EXEC_PREFIX='%{exec_prefix}'
    LIBDIR='%{libdir}'
    MANDIR='%{mandir}'
    INCLUDEDIR='%{includedir}'
    BINDIR='%{bindir}'

sources:
- kind: git_repo
  url: github:rhboot/efivar.git
  track: '[0-9]*'
  exclude:
  - '*rc*'
  ref: 40-0-g226c3299ece37424e9007b555f57f54b1f458b9c
  version-guess-pattern: '(\d+)'
- kind: patch_queue
  path: patches/efivar
