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
  ref: 2025_09_19.623dbf6-0-g623dbf6f16d8dedac5a361a0d1daadc772ac842b
