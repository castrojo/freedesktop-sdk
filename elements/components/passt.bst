kind: make

depends:
- bootstrap-import.bst

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
  ref: 2025_05_03.587980c-0-g587980ca1e9d5645f6738f67ec3f15cc61a7efa3
