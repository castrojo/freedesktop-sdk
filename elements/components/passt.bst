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
  ref: 2025_12_23.2ba9fd5-0-g2ba9fd58183cd1d6e01c9b95a1fd433f2e7da42a
