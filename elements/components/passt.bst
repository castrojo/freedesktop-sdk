kind: make

build-depends:
- public-stacks/buildsystem-make.bst

depends:
- public-stacks/runtime-minimal.bst

variables:
  make-args: >-
    prefix="%{prefix}"
    exec_prefix="%{exec_prefix}"
    bindir="%{bindir}"
    datarootdir="%{datadir}"
    docdir="%{docdir}"
    mandir="%{mandir}"

sources:
- kind: git_repo
  url: fdsdk_mirror:passt/passt.git
  track: '*_*_*.*'
  ref: 2026_07_16.090d739-0-g090d739bd16ed0d810bf2fe9603229aad74adc62
