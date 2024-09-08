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
  url: passt:passt
  track: '*_*_*.*'
  ref: 2024_09_06.6b38f07-0-g6b38f0723949f8b4b2787ee55d4330249a1a4a3e
